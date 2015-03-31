require 'vcr' 
VCR.configure do |config| 
  config.cassette_library_dir = "spec/fixtures/cassettes" 
  config.hook_into :webmock

  config.filter_sensitive_data('SONGKICK_APIKEY') { 'key' }
  config.filter_sensitive_data('LASTFM_API_KEY') { 'key' }
  config.filter_sensitive_data('LASTFM_SECRET_KEY') { 'key' }
end
