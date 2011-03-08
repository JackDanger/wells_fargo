module WellsFargo
  class VendorParty < WellsFargo::Element

    child :Name
    child :RefInfo
    child :PostAddr
    child :ContactInfo
  end
end
