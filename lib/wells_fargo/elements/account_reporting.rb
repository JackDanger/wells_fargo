class AccountReporting < WellsFargo::Element

  child :CurrAmt, :limit => 1
  child :CurCode, :limit => 1
  child :ReasonCode, :limit => 1
  child :AcctID, :limit => 1
  child :BankIDType, :limit => 1
  child :BankID, :limit => 1
end
