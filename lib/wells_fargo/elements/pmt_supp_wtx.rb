class PmtSuppWTX < WellsFargo::Element

  child :LiabilityDate, :limit => 1
  child :AccessCode, :limit => 1
  child :Pin, :limit => 1
  child :StateFedCode, :limit => 1
  child :TaxAuthorityCode, :limit => 1
  child :TaxTypeCode, :limit => 1
  child :Amount1, :limit => 1
  child :AmountType1, :limit => 1
  child :Amount2, :limit => 1
  child :AmountType2, :limit => 1
  child :Amount3, :limit => 1
  child :AmountType3, :limit => 1
  child :Amount4, :limit => 1
  child :AmountType4, :limit => 1
end
