module WellsFargo
  class PaymentManager
    def initialize(business_name, options = {})
      @elements = []
      start_file business_name, options
    end

    def start_file(name, options)
      builder = Builder::XmlMarkup.new
      attributes = {}
      attributes['CompanyID'] = name
      attributes['xmlns:xsi'] = "http://www.w3.org/2001/XMLSchema-instance"
      attributes['PmtRecCount'] = options[:pmg_rec_count] if options[:pmg_rec_count]
      attributes['PmtRecTotal'] = options[:pmg_rec_total] if options[:pmg_rec_total]
      @file = builder.File attributes
    end

    protected

      def method_missing method, *args, &block
        if WellsFargo::Element.constants.include? method.to_s
          child method, *args, &block
        else
          super
        end
      end
  end
end