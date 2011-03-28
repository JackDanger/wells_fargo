module WellsFargo
  class PaymentManager
    def initialize(business_name, options = {})
      @elements = []
      @business_name = business_name
      @options = options
    end

    def file
      @xml = Builder::XmlMarkup.new(:indent => 2)
      attributes = {}
      attributes['CompanyID'] = @business_name
      attributes['xmlns:xsi'] = "http://www.w3.org/2001/XMLSchema-instance"
      attributes['PmtRecCount'] = @options[:pmt_rec_count] if @options[:pmt_rec_count]
      attributes['PmtRecTotal'] = @options[:pmt_rec_total] if @options[:pmt_rec_total]
      root = WellsFargo::Element::File.new(@xml, attributes)
      @xml.instruct!
      @xml.tag! root.element_name, root.attributes do
        yield root
      end
    end

    def to_xml
      @xml.target!
    end
  end
end