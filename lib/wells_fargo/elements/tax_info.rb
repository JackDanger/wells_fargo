class TaxInfo < WellsFargo::Element
  attribute :TaxType
  child :OrgID, :limit => 1
  child :CurAmt, :limit => 1
  child :Rate, :limit => 1
end
