module WellsFargo
  class Element
    class Message < WellsFargo::Element
      attribute :msg_type

      child :msg_text, :limit => 0
    end
  end
end
