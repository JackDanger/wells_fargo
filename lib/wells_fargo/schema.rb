module WellsFargo
  module Schema

    Schema      = File.expand_path File.join(File.dirname(__FILE__), '..', 'schema.xml')
    ElementDir  = File.expand_path File.join(File.dirname(__FILE__), 'elements')
    NameMapFile = File.expand_path File.join(ElementDir, 'name_map.rb')
    class << self

      def NameMap
        Marshal.load File.read(NameMapFile)
      rescue Errno::ENOENT
        {}
      end

      def generate_element_files
        @name_map = {}
        schema do |definition|
          class_name = definition.attributes['name'].value
          file = File.join(ElementDir, "#{WellsFargo.underscore class_name}.rb")
          puts "Writing #{class_name} => #{File.basename file}"
          File.open(file, 'w') do |f|
            f.write <<-EOF  
module WellsFargo
  class Element
    class #{class_name} < WellsFargo::Element
#{(definition / 'xsd|attribute').map do |attr|

  name = attr.attributes['name'].value.gsub(/\s+/, '')
  @name_map[WellsFargo.underscore name] = name
  name = WellsFargo.underscore name

  use = attr.attributes['use']

  if use && 'required' == use.value
    "      required_attribute :#{name}"
  else
    "      attribute :#{name}"
  end
end.join("\n")}

#{(definition / 'xsd|element').map do |element|

  name = (element.attributes['ref'] || element.attributes['name']).value.gsub(/\s+/, '')
  @name_map[WellsFargo.underscore name] = name
  name = WellsFargo.underscore name
  options = {}
  limit = ((max = element.attributes['maxOccurs']) && max && max.value).to_i
  options[:limit] = limit if limit > 0
  options[:simple] = true if element.attributes['ref'].nil?

  if {} == options
    "      child :#{name}"
  else
    "      child :#{name}, :limit => #{limit}"
  end
end.join("\n")}
    end
  end
end
EOF
          end
          save_name_map
        end
      end

      def schema
        (load_schema / 'xsd|schema > xsd|element').each do |element|
          yield element
        end
      end

      protected

        def save_name_map
          File.open(NameMapFile, 'w') {|f| f.write Marshal.dump(@name_map) }
        end
    
        def load_schema
          require 'nokogiri'
          Nokogiri::XML File.read(Schema)
        end
    end
  end
end