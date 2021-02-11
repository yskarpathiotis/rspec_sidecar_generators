require 'rails_helper'

<% module_namespacing do -%>
RSpec.describe "GET /<%= name.underscore.pluralize %>/new", <%= type_metatag(:request) %> do
<% if mountable_engine? -%>
  include Engine.routes.url_helpers
<% end -%>
  it "renders a successful response" do
    get <%= new_helper %>
    expect(response).to be_successful
  end
end
<% end -%>
