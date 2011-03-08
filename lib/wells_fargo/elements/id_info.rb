module WellsFargo
  class Element
    class IDInfo < WellsFargo::Element
      attribute :id_type

      child :id, :limit => 0
    end
  end
end
