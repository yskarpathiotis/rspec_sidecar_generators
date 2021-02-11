require 'rails_helper'

<% module_namespacing do -%>
RSpec.describe "GET /<%= name.underscore.pluralize %>/:id", <%= type_metatag(:request) %> do
<% if mountable_engine? -%>
  include Engine.routes.url_helpers
<% end -%>
  let!(:<%= name.underscore %>) {create(:<%= name.underscore %>)}

  it "renders a successful response" do
    get <%= show_helper.tr('@', '') %>
    expect(response).to be_successful
  end
end
<% end -%>
