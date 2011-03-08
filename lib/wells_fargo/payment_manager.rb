module WellsFargo
  class PaymentManager
    def initialize(business_name, options = {})
      @elements = []
      start_document business_name, options
    end

    def start_document(name, options)
      @document = Nokogiri::XML::Node.new 'File'
      @document['CompanyID'] = name
      @document['xmlns:xsi'] = "http://www.w3.org/2001/XMLSchema-instance"
      @document['PmtRecCount'] = options[:pmg_rec_count] if options[:pmg_rec_count]
      @document['PmtRecTotal'] = options[:pmg_rec_total] if options[:pmg_rec_total]
    end

    protected

      def method_missing method, *args, &block
        if @@attributes.include? method.to_sym
          attribute method, *args, &block
        elsif @@children.any? {|c| method.to_sym == c[:name] }
          child method, *args, &block
        else
          super
        end
      end
  end
end