module WellsFargo
  class Element
    class Note < WellsFargo::Element
      attribute :note_type

      child :note_text, :limit => 0
    end
  end
end
