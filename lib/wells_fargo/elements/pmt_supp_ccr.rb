module WellsFargo
  class Element
    class PmtSuppCCR < WellsFargo::Element


      child :payee_type, :limit => 1
      child :exp_date, :limit => 1
      child :merchant_id, :limit => 1
      child :mcc_code, :limit => 1
      child :division, :limit => 1
    end
  end
end
