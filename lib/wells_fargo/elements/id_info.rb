class IDInfo < WellsFargo::Element
  attribute :IDType
  child :ID, :limit => 0
end
