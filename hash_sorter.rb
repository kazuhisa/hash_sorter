require 'ya2yaml'
require 'yaml'

path = ARGV[0]
h = YAML.load_file(path)
puts h.ya2yaml
