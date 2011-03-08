require File.expand_path File.join(File.dirname(__FILE__), 'test_helper')

class ElementTest < Test::Unit::TestCase
  context "with simple xml calls" do
    setup {
      @xml = Builder::XmlMarkup.new
      element = WellsFargo::Element::PmtRec.new(@xml, :PmtFormat => 'CHK')
      @xml.tag! element.name, element.attributes do
        @xml.CurAmt '290.00'
      end
    }
    should "be able to render to xml" do
      assert_equal '<PmtRec PmtFormat="CHK"><CurAmt>290.00</CurAmt></PmtRec>',
                   @xml.target!
    end
  end
  context "with DSL calls" do
    setup {
      @xml = Builder::XmlMarkup.new
      payment = WellsFargo::Element::PmtRec.new(@xml, :PmtFormat => 'CHK')
      @xml.tag! payment.name, payment.attributes do |x|
        payment.cur_amt '290.00'
      end
    }
    should "be able to render to xml" do
      assert_equal '<PmtRec PmtFormat="CHK"><CurAmt>290.00</CurAmt></PmtRec>',
                   @xml.target!
    end
  end
  context "with many child nodes" do
    setup {
      @xml = Builder::XmlMarkup.new(:indent => 2)
      file = WellsFargo::Element::File.new(@xml, {})
      @xml.tag! file.name do
        file.pmt_rec :PmtFormat => 'CHK' do |payment|
          payment.ref_info :RefType => 'IA' do |ref|
            ref.ref_id 'Insert1'
          end
          payment.ref_info :RefType => '5A' do |ref|
            ref.ref_id 'Flex Field Data'
          end
          payment.ref_info :RefType => '1A' do |ref|
            ref.ref_id 'Inline Insert1'
          end
          payment.message :MsgType => 'CHK' do |message|
            message.msg_text 'This is the Check Memo Field'
          end
          payment.check do |check|
            check.chk_num 2001
            check.chk_doc_num 444333556612345000
            check.chk_ctrl_num 'Courier Name Here'
            check.courier_account 'AJ1247BHER24'
            check.delivery_code 400
          end
          payment.orgnr_party do |party|
            party.name do |name|
              name.name1 'ABC Corporation'
            end
            party.ref_info :RefType => 'A7' do |ref|
              ref.ref_id 'CHKIMG123'
              ref.ref_desc 'Check Image description'
            end
            party.post_addr do |address|
              address.addr1 '321 Main Street'
              address.addr2 'Suite 2'
              address.city 'Phoenix'
              address.state_prov 'AZ'
              address.postal_code '85003'
              address.country 'US'
              address.country_name 'United States'
            end
          end
        end
      end
    }
    should "generate proper nested XML" do
      assert_equal NESTED, @xml.target!
    end
  end
  NESTED = <<NESTED
<File>
  <PmtRec PmtFormat="CHK">
    <RefInfo RefType="IA">
      <RefID>Insert1</RefID>
    </RefInfo>
    <RefInfo RefType="5A">
      <RefID>Flex Field Data</RefID>
    </RefInfo>
    <RefInfo RefType="1A">
      <RefID>Inline Insert1</RefID>
    </RefInfo>
    <Message MsgType="CHK">
      <MsgText>This is the Check Memo Field</MsgText>
    </Message>
    <Check>
      <ChkNum>2001</ChkNum>
      <ChkDocNum>444333556612345000</ChkDocNum>
      <ChkCtrlNum>Courier Name Here</ChkCtrlNum>
      <CourierAccount>AJ1247BHER24</CourierAccount>
      <DeliveryCode>400</DeliveryCode>
    </Check>
    <OrgnrParty>
      <RefInfo RefType="A7">
        <RefID>CHKIMG123</RefID>
        <RefDesc>Check Image description</RefDesc>
      </RefInfo>
      <PostAddr>
        <Addr1>321 Main Street</Addr1>
        <Addr2>Suite 2</Addr2>
        <City>Phoenix</City>
        <StateProv>AZ</StateProv>
        <PostalCode>85003</PostalCode>
        <Country>US</Country>
        <CountryName>United States</CountryName>
      </PostAddr>
    </OrgnrParty>
  </PmtRec>
</File>
NESTED
end