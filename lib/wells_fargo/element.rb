module WellsFargo
  class Element
    class << self
      def attribute attribute
        @attributes ||= []
        @attributes << attribute
      end

      def requied_attribute attribute
        @required_attributes ||= []
        @required_attributes << attribute
      end

      def child name, limit = nil
        @children ||= []
        @children << {:name => name, :limit => limit}
      end
    end
  end
end