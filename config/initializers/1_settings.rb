class Settings < Settingslogic
  source "#{Rails.root}/config/biorob-part-tracker.yml"
  #namespace Rails.env

  def ldap_enabled?
    ldap && ldap['enabled']
  rescue SettingsLogic::MissingSetting
    false
  end

end

