module WellsFargo
  class Element
    class AmtGroup < WellsFargo::Element


      child :desc, :limit => 1
      child :curr_amt, :limit => 1
      child :ytd_amt, :limit => 1
    end
  end
end
