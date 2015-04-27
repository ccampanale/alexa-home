require 'yaml'
	
samsung_tvs_file = File.dirname(File.expand_path(__FILE__)) + '/samsung_tvs.yml'
samsung_tvs_all  = YAML.load_file(samsung_tvs_file)

REMOTEINFO  = samsung_tvs_all['remoteinfo']
SAMSUNG_TVS = samsung_tvs_all['samsung_tvs']


