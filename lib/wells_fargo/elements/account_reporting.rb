module WellsFargo
  class Element
    class AccountReporting < WellsFargo::Element


      child :curr_amt, :limit => 1
      child :cur_code, :limit => 1
      child :reason_code, :limit => 1
      child :acct_id, :limit => 1
      child :bank_id_type, :limit => 1
      child :bank_id, :limit => 1
    end
  end
end
