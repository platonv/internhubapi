Apipie.configure do |config|
  config.app_name                = "InternhubApi"
  config.api_base_url            = "/api"
  config.doc_base_url            = "/apidoc"
  config.namespaced_resources    = true
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
  config.app_info                = "InternHub REST API " 
end
