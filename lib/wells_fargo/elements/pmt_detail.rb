module WellsFargo
  class PmtDetail < WellsFargo::Element

    child :InvoiceInfo
    child :Payroll
  end
end
