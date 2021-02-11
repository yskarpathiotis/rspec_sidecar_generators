require 'generators/rspec'

module RspecSidecarGenerators
    # @private
    class RequestsGenerator < Base
      # Add a deprecation for this class, before rspec-rails 4, to use the
      # `RequestGenerator` instead
      class_option :request_specs,
                   type: :boolean,
                   default: true,
                   desc: "Generate request specs"

      def generate_request_spec
        return unless options[:request_specs]

        template 'request_spec.rb',
                 File.join('spec/requests', "#{name.underscore.pluralize}_spec.rb")
      end
    end
end
