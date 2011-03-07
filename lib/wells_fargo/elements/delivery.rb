class Delivery < WellsFargo::Element

  child :DeliveryType, :limit => 1
  child :DeliveryContactName, :limit => 1
  child :DeliveryFaxNumber, :limit => 1
  child :DeliveryEmailAddress, :limit => 1
  child :DeliveryUserID, :limit => 1
  child :DeliveryCompanyID, :limit => 1
  child :SecureType, :limit => 1
  child :SecureQuestion01, :limit => 1
  child :SecurePassword01, :limit => 1
  child :SecureQuestion02, :limit => 1
  child :SecurePassword02, :limit => 1
  child :ReceivingAddress1, :limit => 1
  child :ReceivingAddress2, :limit => 1
  child :ReceivingCity, :limit => 1
  child :ReceivingState, :limit => 1
  child :ReceivingZip, :limit => 1
  child :ReceivingCountry, :limit => 1
  child :ReceivingCountryCode, :limit => 1
  child : DeliveryCode, :limit => 1
  child : CourierAccount, :limit => 1
end
