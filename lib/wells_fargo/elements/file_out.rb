module WellsFargo
  class Element
    class FileOut < WellsFargo::Element


      child :file_type, :limit => 0
      child :file_format, :limit => 0
      child :delivery
    end
  end
end
