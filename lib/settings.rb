class Settings < Settingslogic
  source (ENV['CONFIG_YML'] || "config/config.yml")
end
