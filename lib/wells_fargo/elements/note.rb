module WellsFargo
  class Note < WellsFargo::Element
    attribute :NoteType
    child :NoteText, :limit => 0
  end
end
