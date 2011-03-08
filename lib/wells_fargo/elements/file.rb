module WellsFargo
  class Element
    class File < WellsFargo::Element
      attribute :company_id
      attribute :process_id
      attribute :document_type
      attribute :pmt_rec_count
      attribute :pmt_rec_total

      child :pmt_rec
      child :file_info_grp
    end
  end
end
