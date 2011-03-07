class Check < WellsFargo::Element

  child :ChkNum, :limit => 1
  child :ChkDocNum, :limit => 1
  child :ChkCtrlNum, :limit => 1
  child :CourierName, :limit => 1
  child :CourierAccount, :limit => 1
  child :DeliveryCode, :limit => 1
end
