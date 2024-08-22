require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        name: "Name",
        description: "MyText",
        quantity: 2,
        status: "Status",
        institution: nil
      ),
      Product.create!(
        name: "Name",
        description: "MyText",
        quantity: 2,
        status: "Status",
        institution: nil
      )
    ])
  end

  it "renders a list of products" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Status".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
