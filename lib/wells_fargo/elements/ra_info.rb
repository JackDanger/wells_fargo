module WellsFargo
  class Element
    class RAInfo < WellsFargo::Element
      attribute :ra_num_type

      child :ra_num, :limit => 1
      child :ra_date, :limit => 1
      child :desc, :limit => 1
    end
  end
end
