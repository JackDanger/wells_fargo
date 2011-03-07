class PmtSuppCCR < WellsFargo::Element

  child :PayeeType, :limit => 1
  child :ExpDate, :limit => 1
  child :MerchantID, :limit => 1
  child :MCCCode, :limit => 1
  child :Division, :limit => 1
end
