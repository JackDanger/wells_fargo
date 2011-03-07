class PmtSuppFDM < WellsFargo::Element

  child :CardType, :limit => 1
  child :ExpDate, :limit => 1
  child :OrderFlag, :limit => 1
  child :EC, :limit => 1
end
