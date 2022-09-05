require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Category model' do
    @user = User.create(name: 'Tom', email: 'tom@example.com', password: '123456')
    subject { Category.new(user_id: @user, name: 'Microverse', icon: fixture_file_upload('budget.png')) }
    before { subject.save }

    it 'should check if the name is not blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should check if the measurement_unit is not blank' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end
  end
end
