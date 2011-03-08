module WellsFargo
  class ContactInfo < WellsFargo::Element
    attribute :Name
    child :PhoneNum, :limit => 1
    child :EmailAddr, :limit => 1
    child :URL, :limit => 1
  end
end
