module WellsFargo
  class Element
    class PmtSuppFDM < WellsFargo::Element


      child :card_type, :limit => 1
      child :exp_date, :limit => 1
      child :order_flag, :limit => 1
      child :ec, :limit => 1
    end
  end
end
