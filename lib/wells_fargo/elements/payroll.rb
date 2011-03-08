module WellsFargo
  class Payroll < WellsFargo::Element
    attribute :PrdEndDate
    attribute :PrdBeginDate
    child :Exemptions
    child :Message
    child :AdditionalDetails
    child :Earnings
    child :EarningsTotal
    child :Deductions
    child :DeductionsTotal
    child :AccountReporting
    child :RefInfo
  end
end
