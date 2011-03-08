module WellsFargo
  class Element
    class Earnings < WellsFargo::Element


      child :hours, :limit => 1
      child :amt_group, :limit => 1
    end
  end
end
