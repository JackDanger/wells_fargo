module WellsFargo
  class PmtRec < WellsFargo::Element
    attribute :PmtFormat
    attribute :PmtFormatIntl
    required_attribute :PmtMethod
    attribute :DeliveryMethod
    attribute :TranHandlingCode
    attribute :InvoiceMgrFlag
    attribute :PmtCrDr
    child :RefInfo
    child :IDInfo
    child :DateInfo
    child :Message
    child :Check
    child :OrgnrParty
    child :RcvrParty
    child :DeliveryParty
    child :ReturnParty
    child :OrgnrDepAcctID
    child :RcvrDepAcctID
    child :IntermediaryDepAcctID, :limit => 2
    child :VendorParty
    child :PmtDetail
    child :DocDelivery
    child :PDPHandlingCode, :limit => 0
    child :PmtID, :limit => 0
    child :PmtSuppWTX
    child :PmtSuppFDM
    child :PmtSuppPOB
    child :PmtSuppCCR
    child :CurAmt
    child :CurCode, :limit => 0
    child :PrcDate, :limit => 0
    child :ValueDate, :limit => 0
    child :RlsDate, :limit => 0
    child :InvoiceMgr
  end
end
