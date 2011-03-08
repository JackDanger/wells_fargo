module WellsFargo
  class Element
    class PmtSuppWTX < WellsFargo::Element


      child :liability_date, :limit => 1
      child :access_code, :limit => 1
      child :pin, :limit => 1
      child :state_fed_code, :limit => 1
      child :tax_authority_code, :limit => 1
      child :tax_type_code, :limit => 1
      child :amount1, :limit => 1
      child :amount_type1, :limit => 1
      child :amount2, :limit => 1
      child :amount_type2, :limit => 1
      child :amount3, :limit => 1
      child :amount_type3, :limit => 1
      child :amount4, :limit => 1
      child :amount_type4, :limit => 1
    end
  end
end
