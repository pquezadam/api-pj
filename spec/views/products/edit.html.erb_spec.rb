require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      name: "MyString",
      sku: "MyString",
      type: "",
      price: 1
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input[name=?]", "product[name]"

      assert_select "input[name=?]", "product[sku]"

      assert_select "input[name=?]", "product[type]"

      assert_select "input[name=?]", "product[price]"
    end
  end
end
