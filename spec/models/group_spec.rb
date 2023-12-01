require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) do
    User.create(id: 1, name: 'John Doe', email: 'john@example.com', password: 'password123',
                password_confirmation: 'password123')
  end
  it 'is valid with valid attributes' do
    group = Group.new(
      name: 'Fast Food',
      icon: 'imgexample.png',
      user_id: user.id
    )
    expect(group).to be_valid
  end

  describe 'associations' do
    it 'has many payments' do
      expect(Group.reflect_on_association(:entities).macro).to eq(:has_many)
    end
    it 'belongs to user' do
      group = Group.new(
        name: 'Fast Food',
        icon: 'imgexample.png',
        user_id: user.id
      )
      expect(group.user).to eq(user)
    end
  end
end
