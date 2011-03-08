module WellsFargo
  class Element

    attr_accessor :xml, :children, :attributes

    NameMap = Schema.NameMap

    def initialize xml, attributes
      @xml = xml
      @attributes = attributes
    end

    def add_child name, attributes = {}, &block
      @children ||= []
      @children << {:name => name, :attributes => attributes, :block => block}
    end

    def finish! 
      children.each do |child|
        render child
      end
    end

    def render node
      child_class = element_class NameMap[node[:name].to_s]
      child = child_class.new(xml, node[:attributes])

      capture = proc do |x|
        if node[:block]
          content = yield child
          child.finish!
          content.to_s
        elsif !child.attributes.is_a?(Hash)
          child.attributes.to_s
        end
      end

      puts "Calling #{child.element_name} to build #{child.class.name}"
      if child.attributes.is_a?(Hash)
        xml.tag! child.element_name, child.attributes, &capture
      else
        xml.tag! child.element_name, child.attributes
      end
    end

    def element_name
      self.class.name.split('::').last
    end

    protected

      def element_class name
        Element.const_get name
      rescue
        Element.const_set name, Class.new(Element)
        Element.const_get name
      end

      def method_missing method, *args, &block
        if self.class.children.any? {|c| method.to_sym == c[:name] }
          add_child method, *args, &block
        else
          super
        end
      end
  end

  class << Element
    attr_accessor :attributes, :required, :children
    def attribute name
      @attributes ||= []
      @attributes << name
    end

    def required_attribute name
      @required ||= []
      @required << name
      attribute name
    end

    def child name, limit = nil
      @children ||= []
      @children << {:name => name, :limit => limit}
    end
  end
end

Dir.glob(File.join(File.dirname(__FILE__), 'elements', '*')).each do |element|
  require element
end