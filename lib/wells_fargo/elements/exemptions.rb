class Exemptions < WellsFargo::Element

  child :StateExmpt, :limit => 1
  child :FedExmpt, :limit => 1
  child :WithholdStatus, :limit => 1
  child :WithholdAmt, :limit => 1
end
