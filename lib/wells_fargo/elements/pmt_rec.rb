module WellsFargo
  class Element
    class PmtRec < WellsFargo::Element
      attribute :pmt_format
      attribute :pmt_format_intl
      required_attribute :pmt_method
      attribute :delivery_method
      attribute :tran_handling_code
      attribute :invoice_mgr_flag
      attribute :pmt_cr_dr

      child :ref_info
      child :id_info
      child :date_info
      child :message
      child :check
      child :orgnr_party
      child :rcvr_party
      child :delivery_party
      child :return_party
      child :orgnr_dep_acct_id
      child :rcvr_dep_acct_id
      child :intermediary_dep_acct_id, :limit => 2
      child :vendor_party
      child :pmt_detail
      child :doc_delivery
      child :pdp_handling_code, :limit => 0
      child :pmt_id, :limit => 0
      child :pmt_supp_wtx
      child :pmt_supp_fdm
      child :pmt_supp_pob
      child :pmt_supp_ccr
      child :cur_amt
      child :cur_code, :limit => 0
      child :prc_date, :limit => 0
      child :value_date, :limit => 0
      child :rls_date, :limit => 0
      child :invoice_mgr
    end
  end
end
