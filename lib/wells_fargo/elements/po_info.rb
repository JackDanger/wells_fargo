module WellsFargo
  class POInfo < WellsFargo::Element
    attribute :POType
    child :PONum, :limit => 1
    child :Desc, :limit => 1
  end
end
