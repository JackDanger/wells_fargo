module WellsFargo
  class InvoiceAdj < WellsFargo::Element
    attribute :AdjType
    attribute :AdjNumType
    child :InvoiceAdjNum, :limit => 0
    child :Note
    child :CurAmt
    child :EffDt
    child :Desc, :limit => 0
    child :RAInfo
  end
end
