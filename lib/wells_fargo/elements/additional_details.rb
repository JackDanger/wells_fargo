module WellsFargo
  class Element
    class AdditionalDetails < WellsFargo::Element


      child :desc, :limit => 1
      child :details, :limit => 1
    end
  end
end
