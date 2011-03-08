module WellsFargo
  class Element

    attr_accessor :xml, :attributes

    def initialize xml, attributes
      @xml = xml
      @attributes = attributes
    end

    def add_child name, attributes = {}, &block
      child = camelize(name).constantize.new(xml, attributes)
      xml.send *child.node do
        yield child
      end
    end

    def node
      [self.class.name.split('::').last, attributes]
    end

    protected

      def method_missing method, *args, &block
        if self.class.attributes.include? method.to_sym
          attribute method, *args, &block
        elsif self.class.children.any? {|c| method.to_sym == c[:name] }
          child method, *args, &block
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