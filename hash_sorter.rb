require 'ya2yaml'
require 'yaml'

class Hash
  # http://dan.doezema.com/2012/04/recursively-sort-ruby-hash-by-key/
  def sort_by_key(recursive = false, &block)
    self.keys.sort(&block).reduce({}) do |seed, key|
      seed[key] = self[key]
      if recursive && seed[key].is_a?(Hash)
        seed[key] = seed[key].sort_by_key(true, &block)
      end
      seed
    end
  end
end

path = ARGV[0]
h = YAML.load_file(path)
puts h.sort_by_key.ya2yaml.gsub(/\s$/,"\n")
