module WellsFargo
  class Element
    class Check < WellsFargo::Element


      child :chk_num, :limit => 1
      child :chk_doc_num, :limit => 1
      child :chk_ctrl_num, :limit => 1
      child :courier_name, :limit => 1
      child :courier_account, :limit => 1
      child :delivery_code, :limit => 1
    end
  end
end
