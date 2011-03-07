class PostAddr < WellsFargo::Element

  child :Addr1, :limit => 1
  child :Addr2, :limit => 1
  child :Addr3, :limit => 1
  child :City, :limit => 1
  child :StateProv, :limit => 1
  child :PostalCode, :limit => 1
  child :Country, :limit => 1
  child :CountryName, :limit => 1
end
