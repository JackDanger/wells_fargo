module WellsFargo
  class Element
    class Payroll < WellsFargo::Element
      attribute :prd_end_date
      attribute :prd_begin_date

      child :exemptions
      child :message
      child :additional_details
      child :earnings
      child :earnings_total
      child :deductions
      child :deductions_total
      child :account_reporting
      child :ref_info
    end
  end
end
