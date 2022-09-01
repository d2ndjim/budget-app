require 'rails_helper'

RSpec.describe "records/index", type: :view do
  before(:each) do
    assign(:records, [
      Record.create!(
        user: nil,
        name: "Name",
        amount: "9.99"
      ),
      Record.create!(
        user: nil,
        name: "Name",
        amount: "9.99"
      )
    ])
  end

  it "renders a list of records" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
  end
end
