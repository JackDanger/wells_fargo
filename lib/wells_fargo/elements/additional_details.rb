class AdditionalDetails < WellsFargo::Element

  child :Desc, :limit => 1
  child :Details, :limit => 1
end
