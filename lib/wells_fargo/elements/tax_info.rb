module WellsFargo
  class Element
    class TaxInfo < WellsFargo::Element
      attribute :tax_type

      child :org_id, :limit => 1
      child :cur_amt, :limit => 1
      child :rate, :limit => 1
    end
  end
end
