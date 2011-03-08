module WellsFargo
  class DateInfo < WellsFargo::Element
    attribute :DateType
    child :Date, :limit => 0
  end
end
