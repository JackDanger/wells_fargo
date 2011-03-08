module WellsFargo
  module Schema

    Schema     = File.expand_path File.join(File.dirname(__FILE__), '..', 'schema.xml')
    ElementDir = File.expand_path File.join(File.dirname(__FILE__), 'elements')

    class << self

      def generate_element_files
        schema do |definition|
          name = definition.attributes['name'].value
          file = File.join(ElementDir, "#{underscore name}.rb")
          puts "Writing #{name} => #{File.basename file}"
          File.open(file, 'w') do |f|
            f.write <<-EOF  
module WellsFargo
  class #{name} < WellsFargo::Element
#{(definition / 'xsd|attribute').map do |attr|
  attribute_name = attr.attributes['name'].value.gsub(/\s+/, '')
  use = attr.attributes['use']

  if use && 'required' == use.value
    "    required_attribute :#{attribute_name}"
  else
    "    attribute :#{attribute_name}"
  end
end.join("\n")}
#{(definition / 'xsd|element').map do |element|
  child = (element.attributes['ref'] || element.attributes['name']).value.gsub(/\s+/, '')
  options = {}
  limit = ((max = element.attributes['maxOccurs']) && max && max.value).to_i
  options[:limit] = limit if limit > 0
  options[:simple] = true if element.attributes['ref'].nil?

  if {} == options
    "    child :#{child}"
  else
    "    child :#{child}, :limit => #{limit}"
  end
end.join("\n")}
  end
end
EOF
          end
        end
      end

      def schema
        (load_schema / 'xsd|schema > xsd|element').each do |element|
          yield element
        end
      end

      protected
    
        def load_schema
          require 'nokogiri'
          Nokogiri::XML File.read(Schema)
        end

        # swiped from ActiveSupport
        def underscore(word)
          word = word.to_s.dup
          word.gsub!(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
          word.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
          word.tr!("-", "_")
          word.downcase!
          word
        end
    end
  end
end