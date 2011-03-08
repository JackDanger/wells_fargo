module WellsFargo
  class RefInfo < WellsFargo::Element
    attribute :RefType
    child :RefID, :limit => 0
    child :RefDesc, :limit => 0
  end
end
