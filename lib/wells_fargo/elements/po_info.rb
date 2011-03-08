module WellsFargo
  class Element
    class POInfo < WellsFargo::Element
      attribute :po_type

      child :po_num, :limit => 1
      child :desc, :limit => 1
    end
  end
end
