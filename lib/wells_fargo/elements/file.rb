module WellsFargo
  class File < WellsFargo::Element
    attribute :CompanyID
    attribute :ProcessID
    attribute :DocumentType
    attribute :PmtRecCount
    attribute :PmtRecTotal
    child :PmtRec
    child :FileInfoGrp
  end
end
