require 'rails_helper'

RSpec.describe "records/show", type: :view do
  before(:each) do
    @record = assign(:record, Record.create!(
      user: nil,
      name: "Name",
      amount: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
  end
end
