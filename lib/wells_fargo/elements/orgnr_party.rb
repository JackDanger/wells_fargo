module WellsFargo
  class Element
    class OrgnrParty < WellsFargo::Element


      child :name
      child :ref_info
      child :post_addr
      child :contact_info
    end
  end
end
