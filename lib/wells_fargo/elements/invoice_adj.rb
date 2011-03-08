module WellsFargo
  class Element
    class InvoiceAdj < WellsFargo::Element
      attribute :adj_type
      attribute :adj_num_type

      child :invoice_adj_num, :limit => 0
      child :note
      child :cur_amt
      child :eff_dt
      child :desc, :limit => 0
      child :ra_info
    end
  end
end
