require File.expand_path File.join(File.dirname(__FILE__), 'test_helper')

class ElementTest < Test::Unit::TestCase
  context "simple" do
    setup {
      @xml = Builder::XmlMarkup.new
      @element = WellsFargo::Element::PmtRec.new(@xml, :PmtFormat => 'CHK')
      @xml.tag! *@element.node do
        @xml.CurAmt '290.00'
      end
    }
    should "be able to render to xml" do
      assert_equal '<PmtRec PmtFormat="CHK"><CurAmt>290.00</CurAmt></PmtRec>',
                   @xml.target!
    end
  end
end