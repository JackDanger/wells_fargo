module WellsFargo
  class Element
    class PostAddr < WellsFargo::Element


      child :addr1, :limit => 1
      child :addr2, :limit => 1
      child :addr3, :limit => 1
      child :city, :limit => 1
      child :state_prov, :limit => 1
      child :postal_code, :limit => 1
      child :country, :limit => 1
      child :country_name, :limit => 1
    end
  end
end
