module WellsFargo
  class Element
    class DateInfo < WellsFargo::Element
      attribute :date_type

      child :date, :limit => 0
    end
  end
end
