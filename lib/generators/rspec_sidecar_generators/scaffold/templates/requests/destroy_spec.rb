require 'rails_helper'

<% module_namespacing do -%>
RSpec.describe "DELETE /<%= name.underscore.pluralize %>/:id", <%= type_metatag(:request) %> do
<% if mountable_engine? -%>
  include Engine.routes.url_helpers
<% end -%>
  let!(:<%= name.underscore %>) {create(:<%= name.underscore %>)}

  it "destroys the requested <%= ns_file_name %>" do
    expect {
      delete <%= show_helper.tr('@', '') %>
    }.to change(<%= class_name %>, :count).by(-1)
  end

  it "redirects to the <%= table_name %> list" do
    delete <%= show_helper.tr('@', '') %>
    expect(response).to redirect_to(<%= index_helper %>_url)
  end
end
<% end -%>
