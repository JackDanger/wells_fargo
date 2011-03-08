module WellsFargo
  class Element
    class RefInfo < WellsFargo::Element
      attribute :ref_type

      child :ref_id, :limit => 0
      child :ref_desc, :limit => 0
    end
  end
end
