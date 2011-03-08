module WellsFargo
  class Element
    class Name < WellsFargo::Element


      child :name1, :limit => 1
      child :name2, :limit => 1
      child :name3, :limit => 1
    end
  end
end
