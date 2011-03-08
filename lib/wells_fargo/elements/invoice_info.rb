module WellsFargo
  class Element
    class InvoiceInfo < WellsFargo::Element
      attribute :pmt_action_code
      attribute :discount_cur_amt
      attribute :total_cur_amt
      attribute :net_cur_amt
      attribute :withd_amt
      attribute :eff_dt
      attribute :invoice_type
      attribute :invoice_num

      child :ref_info
      child :note
      child :tax_info
      child :invoice_adj
      child :po_info
    end
  end
end
