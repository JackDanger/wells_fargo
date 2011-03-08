module WellsFargo
  class Earnings < WellsFargo::Element

    child :Hours, :limit => 1
    child :AmtGroup, :limit => 1
  end
end
