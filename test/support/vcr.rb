VCR.configure do |v|
  path = File.expand_path("../../", __FILE__)
  v.cassette_library_dir = "#{path}/vcr"
  v.hook_into :webmock
end
