class FileOut < WellsFargo::Element

  child :FileType, :limit => 0
  child :FileFormat, :limit => 0
  child :Delivery
end
