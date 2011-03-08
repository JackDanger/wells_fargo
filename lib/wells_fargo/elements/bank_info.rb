module WellsFargo
  class Element
    class BankInfo < WellsFargo::Element
      attribute :name
      attribute :branch_id
      attribute :branch_name
      attribute :bank_id_type

      child :ref_info
      child :post_addr
      child :bank_id
    end
  end
end
