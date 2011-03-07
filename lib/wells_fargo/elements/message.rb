class Message < WellsFargo::Element
  attribute :MsgType
  child :MsgText, :limit => 0
end
