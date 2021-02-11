require 'rails_helper'

<% module_namespacing do -%>
RSpec.describe "POST /<%= name.underscore.pluralize %>", <%= type_metatag(:request) %> do
<% if mountable_engine? -%>
  include Engine.routes.url_helpers
<% end -%>
  context "with valid parameters" do
    let(:valid_attributes) {
      skip("Add a hash of attributes valid for your model")
    }

    it "creates a new <%= class_name %>" do
      expect {
        post <%= index_helper %>_url, params: { <%= ns_file_name %>: valid_attributes }
      }.to change(<%= class_name %>, :count).by(1)
    end

    it "redirects to the created <%= ns_file_name %>" do
      post <%= index_helper %>_url, params: { <%= ns_file_name %>: valid_attributes }
      expect(response).to redirect_to(<%= show_helper.gsub("\@#{file_name}", class_name+".last") %>)
    end
  end

  context "with invalid parameters" do
    let(:invalid_attributes) {
      skip("Add a hash of attributes invalid for your model")
    }

    it "does not create a new <%= class_name %>" do
      expect {
        post <%= index_helper %>_url, params: { <%= ns_file_name %>: invalid_attributes }
      }.to change(<%= class_name %>, :count).by(0)
    end

    it "renders a successful response (i.e. to display the 'new' template)" do
      post <%= index_helper %>_url, params: { <%= ns_file_name %>: invalid_attributes }
      expect(response).to be_successful
    end
  end
end
<% end -%>
