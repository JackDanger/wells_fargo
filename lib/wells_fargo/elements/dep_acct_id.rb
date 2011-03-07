class DepAcctID < WellsFargo::Element
  attribute :AcctID
  attribute :AcctType
  attribute :AcctCur
  child :BankInfo
end
