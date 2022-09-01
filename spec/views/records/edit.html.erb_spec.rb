require 'rails_helper'

RSpec.describe "records/edit", type: :view do
  before(:each) do
    @record = assign(:record, Record.create!(
      user: nil,
      name: "MyString",
      amount: "9.99"
    ))
  end

  it "renders the edit record form" do
    render

    assert_select "form[action=?][method=?]", record_path(@record), "post" do

      assert_select "input[name=?]", "record[user_id]"

      assert_select "input[name=?]", "record[name]"

      assert_select "input[name=?]", "record[amount]"
    end
  end
end
