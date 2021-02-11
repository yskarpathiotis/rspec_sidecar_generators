require 'generators/rspec_sidecar_generators'
require 'rails/generators/resource_helpers'

module RspecSidecarGenerators
  # @private
  class ScaffoldGenerator < Base
    include ::Rails::Generators::ResourceHelpers
    argument :attributes, type: :array, default: [], banner: "field:type field:type"

    # class_option :controller_specs, type: :boolean, default: false, desc: "Generate controller specs"
    class_option :request_specs,    type: :boolean, default: true,  desc: "Generate request specs"
    # class_option :view_specs,       type: :boolean, default: true,  desc: "Generate view specs"
    # class_option :helper_specs,     type: :boolean, default: true,  desc: "Generate helper specs"
    # class_option :routing_specs,    type: :boolean, default: true,  desc: "Generate routing specs"

    def initialize(*args, &blk)
      @generator_args = args.first
      super(*args, &blk)
    end

    def generate_request_spec
      return unless options[:request_specs]

      copy_request :index
      copy_request :new
      copy_request :show
      copy_request :edit
      copy_request :create
      copy_request :update
      copy_request :destroy
    end

    protected

    attr_reader :generator_args

    def copy_request(request)
      template "requests/#{request}_spec.rb", template_file(folder: 'requests', request: request)
    end

    # support for namespaced-resources
    def ns_file_name
      return file_name if ns_parts.empty?

      "#{ns_prefix.map(&:underscore).join('/')}_#{ns_suffix.singularize.underscore}"
    end

    # support for namespaced-resources
    def ns_table_name
      return table_name if ns_parts.empty?

      "#{ns_prefix.map(&:underscore).join('/')}/#{ns_suffix.tableize}"
    end

    def ns_parts
      @ns_parts ||= begin
                      parts = generator_args[0].split(/\/|::/)
                      parts.size > 1 ? parts : []
                    end
    end

    def ns_prefix
      @ns_prefix ||= ns_parts[0..-2]
    end

    def ns_suffix
      @ns_suffix ||= ns_parts[-1]
    end

    def value_for(attribute)
      raw_value_for(attribute).inspect
    end

    def raw_value_for(attribute)
      case attribute.type
      when :string
        attribute.name.titleize
      when :integer, :float
        @attribute_id_map ||= {}
        @attribute_id_map[attribute] ||= @attribute_id_map.keys.size.next + attribute.default
      else
        attribute.default
      end
    end

    def template_file(folder:, request:)
      File.join('spec', folder, ns_table_name, controller_class_path, "#{request}_spec.rb")
    end

    def banner
      self.class.banner
    end
  end
end
