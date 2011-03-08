module WellsFargo
  class Element
    class Delivery < WellsFargo::Element


      child :delivery_type, :limit => 1
      child :delivery_contact_name, :limit => 1
      child :delivery_fax_number, :limit => 1
      child :delivery_email_address, :limit => 1
      child :delivery_user_id, :limit => 1
      child :delivery_company_id, :limit => 1
      child :secure_type, :limit => 1
      child :secure_question01, :limit => 1
      child :secure_password01, :limit => 1
      child :secure_question02, :limit => 1
      child :secure_password02, :limit => 1
      child :receiving_address1, :limit => 1
      child :receiving_address2, :limit => 1
      child :receiving_city, :limit => 1
      child :receiving_state, :limit => 1
      child :receiving_zip, :limit => 1
      child :receiving_country, :limit => 1
      child :receiving_country_code, :limit => 1
      child :delivery_code, :limit => 1
      child :courier_account, :limit => 1
    end
  end
end
