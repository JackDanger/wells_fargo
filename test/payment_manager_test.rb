require File.expand_path File.join(File.dirname(__FILE__), 'test_helper')

class PaymentManagerTest < Test::Unit::TestCase
  context "client" do
    setup {
      @client = WellsFargo::PaymentManager.new 'TestCompany'
    }
    context "with one check payable record" do
      setup {
        build_check_payable @client
      }
    end
  end

  def build_check_payable(client)
    client.PmtRec do |payable|
      payable.method :CHK
      payable.ref_info 'IA', 'Insert1'
      payable.ref '5A', 'Flex Field Data'
      payable.ref '1A', 'Inline Insert1'
      payable.message :CHK, 'This is the Check Memo Field'
      payable.check do |check|
        check.number 2001
        check.document_number 444333556612345000
        check.courier 'Courier Name Here'
        check.courier_account 'AJ1247BHER24'
        check.delivery_code 400
      end
      payable.origin_party do |party|
        party.name 'ABC Corporation'
        party.ref 'A7', 'CHKIMG123', 'Check Image description'
        party.postal_address do |address|
          address.address1 '321 Main Street'
          address.address2 'Suite 2'
          address.city 'Phoenix'
          address.state 'AZ'
          address.postal_code '85003'
          address.country 'US'
          address.country_name 'United States'
        end
      end
      payable.receiver_party do |party|
        party.name 'ACME Corp'
        party.ref 'VN', '13868'
        party.postal_address do |address|
          address.address1 '118 Test Drive'
          address.address2 '#44A'
          address.city 'Columbus'
          address.state 'OH'
          address.postal_code '43228'
          address.country 'US'
          address.country_name 'United States'
        end
      end
      payable.delivery_party do |party|
        party.name 'ACME Corp'
        party.ref 'LT', 'Delivery Label Text Here'
        party.postal_address do |address|
          address.address1 '118 Test Drive'
          address.address2 '#44A'
          address.address3 'Third address line to map to Address line 3'
          address.city 'Columbus'
          address.state 'OH'
          address.postal_code '43228'
          address.country 'US'
          address.country_name 'United States'
        end
        party.contact_info do |contact|
          contact.phone '18005551212'
        end
      end
      payable.return_party do |party|
        party.name 'ACME Corp'
        party.postal_address do |address|
          address.address1 '118 Test Drive'
          address.address2 '#44A'
          address.address3 'Third address line to map to Address line 3'
          address.city 'Columbus'
          address.state 'OH'
          address.postal_code '43228'
          address.country 'US'
          address.country_name 'United States'
        end
        party.contact_info do |contact|
          contact.phone '18005551212'
        end
      end
      payable.originator_department_account_id do |originator|
        originator.department_account_id do |account|
          account.bank_info do |bank|
            bank.name 'WELLS FARGO'
            bank.id_type 'ABA'
            bank.id '121000248'
          end
        end
      end
      payable.payment_detail do |detail|
        detail.invoice_info do |invoice|
          invoice.discount_current_amount '200.00'
          invoice
        end
      end
    end
  end
end
  #   <PmtDetail>
  #     <InvoiceInfo DiscountCurAmt="200.00" TotalCurAmt="1200.00" NetCurAmt="1000.00" EffDt="2006-11-24" InvoiceType="IV" InvoiceNum="INV001">
  #       <RefInfo RefType="5A">
  #         <RefID>Invoice Flex Field Data Here</RefID>
  #       </RefInfo>
  #       <Note NoteType="INV">
  #         <NoteText>Payment for Invoice</NoteText>
  #       </Note>
  #       <InvoiceAdj AdjType="L8" AdjNumType="PY">
  #         <InvoiceAdjNum>Reference 1234567890</InvoiceAdjNum>
  #         <CurAmt>200.00</CurAmt>
  #       </InvoiceAdj>
  #       <POInfo POType="PO">
  #         <PONum>PO555</PONum>
  #       </POInfo>
  #     </InvoiceInfo>
  #   </PmtDetail>
  #   <PmtID>PMT001</PmtID>
  #   <CurAmt>1000.00</CurAmt>
  #   <CurCode>USD</CurCode>
  #   <ValueDate>2010-11-24</ValueDate>
  # </PmtRec>

  ## SCHEMA:
  # <xsd:element name="PmtRec">
  #   <xsd:complexType>
  #     <xsd:sequence>
  #       <xsd:element minOccurs="0" maxOccurs="unbounded" ref="RefInfo"/>
  #       <xsd:element minOccurs="0" maxOccurs="unbounded" ref="IDInfo"/>
  #       <xsd:element minOccurs="0" maxOccurs="unbounded" ref="DateInfo"/>
  #       <xsd:element minOccurs="0" maxOccurs="unbounded" ref="Message"/>
  #       <xsd:element minOccurs="0" ref="Check"/>
  #       <xsd:element minOccurs="0" ref="OrgnrParty"/>
  #       <xsd:element minOccurs="0" ref="RcvrParty"/>
  #       <xsd:element minOccurs="0" ref="DeliveryParty"/>
  #       <xsd:element minOccurs="0" ref="ReturnParty"/>
  #       <xsd:element minOccurs="0" ref="OrgnrDepAcctID"/>
  #       <xsd:element minOccurs="0" ref="RcvrDepAcctID"/>
  #       <xsd:element minOccurs="0" maxOccurs="2" ref="IntermediaryDepAcctID"/>
  #       <xsd:element minOccurs="0" ref="VendorParty"/>
  #       <xsd:element minOccurs="0" ref="PmtDetail"/>
  #       <xsd:element minOccurs="0" ref="DocDelivery"/>
  #       <xsd:element minOccurs="0" name="PDPHandlingCode"/>
  #       <xsd:element minOccurs="0" name="PmtID"/>
  #       <xsd:element minOccurs="0" ref="PmtSuppWTX"/>
  #       <xsd:element minOccurs="0" ref="PmtSuppFDM"/>
  #       <xsd:element minOccurs="0" ref="PmtSuppPOB"/>
  #       <xsd:element minOccurs="0" ref="PmtSuppCCR"/>
  #       <xsd:element minOccurs="0" ref="CurAmt"/>
  #       <xsd:element minOccurs="0" name="CurCode"/>
  #       <xsd:element minOccurs="0" name="PrcDate"/>
  #       <xsd:element minOccurs="0" name="ValueDate"/>
  #       <xsd:element minOccurs="0" name="RlsDate"/>
  #       <xsd:element minOccurs="0" ref="InvoiceMgr"/>
  #     </xsd:sequence>
  #     <xsd:attribute name="PmtFormat"/>
  #     <xsd:attribute name="PmtFormatIntl"/>
  #     <xsd:attribute name="PmtMethod" use="required"/>
  #     <xsd:attribute name="DeliveryMethod"/> 
  #     <xsd:attribute name="TranHandlingCode"/>
  #     <xsd:attribute name="InvoiceMgrFlag"/>
  #     <xsd:attribute name="PmtCrDr" use="optional"/>
  #   </xsd:complexType>
  # </xsd:element>
