require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      name: "MyString",
      sku: "MyString",
      type: "",
      price: 1
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input[name=?]", "product[name]"

      assert_select "input[name=?]", "product[sku]"

      assert_select "input[name=?]", "product[type]"

      assert_select "input[name=?]", "product[price]"
    end
  end
end
