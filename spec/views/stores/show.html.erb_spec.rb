require 'rails_helper'

RSpec.describe "stores/show", type: :view do
  before(:each) do
    @store = assign(:store, Store.create!(
      name: "Name",
      address: "MyText",
      email: "Email",
      phone: "Phone"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
  end
end
