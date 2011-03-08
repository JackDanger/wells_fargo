module WellsFargo
  class BankInfo < WellsFargo::Element
    attribute :Name
    attribute :BranchID
    attribute :BranchName
    attribute :BankIDType
    child :RefInfo
    child :PostAddr
    child :BankID
  end
end
