module WellsFargo
  class Element
    class << self
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

    def child name
      
    end

    def method_missing method, *args, &block
      if @@attributes.include? method.to_sym
        attribute method, *args, &block
      elsif @@children.include? method.to_sym
        child method, *args, &block
      else
        super
      end
    end
  end
end