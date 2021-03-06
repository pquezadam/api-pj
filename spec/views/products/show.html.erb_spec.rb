require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      name: "Name",
      sku: "Sku",
      type: "Type",
      price: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Sku/)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/2/)
  end
end
