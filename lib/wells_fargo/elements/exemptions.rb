module WellsFargo
  class Element
    class Exemptions < WellsFargo::Element


      child :state_exmpt, :limit => 1
      child :fed_exmpt, :limit => 1
      child :withhold_status, :limit => 1
      child :withhold_amt, :limit => 1
    end
  end
end
