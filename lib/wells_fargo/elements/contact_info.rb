module WellsFargo
  class Element
    class ContactInfo < WellsFargo::Element
      attribute :name

      child :phone_num, :limit => 1
      child :email_addr, :limit => 1
      child :url, :limit => 1
    end
  end
end
