module WellsFargo
  class Element
    class DepAcctID < WellsFargo::Element
      attribute :acct_id
      attribute :acct_type
      attribute :acct_cur

      child :bank_info
    end
  end
end
