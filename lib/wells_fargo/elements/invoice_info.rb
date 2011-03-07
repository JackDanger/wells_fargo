class InvoiceInfo < WellsFargo::Element
  attribute :PmtActionCode
  attribute :DiscountCurAmt
  attribute :TotalCurAmt
  attribute :NetCurAmt
  attribute :WithdAmt
  attribute :EffDt
  attribute :InvoiceType
  attribute :InvoiceNum
  child :RefInfo
  child :Note
  child :TaxInfo
  child :InvoiceAdj
  child :POInfo
end
