module WellsFargo
  class Element

    attr_accessor :xml, :attributes

    NameMap = Schema.NameMap

    def initialize xml, attributes
      @xml = xml
      @attributes = attributes
    end

    def add_child name, attributes = {}, &block

      child_class_name = NameMap[name.to_s]
      child_class = ensure_element_class child_class_name

      child = child_class.new(xml, attributes)
      capture = proc do |x|
        if block_given?
          content = yield child
          content.to_s
        elsif !attributes.is_a?(Hash)
          attributes.to_s
        end
      end

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

      def ensure_element_class class_name
        begin
          klass = Element.const_get(class_name)
          top_class = eval("::#{class_name}") rescue false
          raise 'pass to rescue clause' if top_class
        rescue
          Element.const_set(class_name, Class.new(Element))
          klass = Element.const_get(class_name)
        end
        klass
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