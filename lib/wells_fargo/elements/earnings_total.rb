module WellsFargo
  class Element
    class EarningsTotal < WellsFargo::Element


      child :hours, :limit => 1
      child :amt_group, :limit => 1
    end
  end
end
