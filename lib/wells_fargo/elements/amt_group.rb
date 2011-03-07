class AmtGroup < WellsFargo::Element

  child :Desc, :limit => 1
  child :CurrAmt, :limit => 1
  child :YTDAmt, :limit => 1
end
