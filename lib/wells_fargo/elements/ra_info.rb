class RAInfo < WellsFargo::Element
  attribute :RANumType
  child :RANum, :limit => 1
  child :RADate, :limit => 1
  child :Desc, :limit => 1
end
