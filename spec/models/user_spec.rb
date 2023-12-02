require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(
      name: 'John Doe',
      email: 'john@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(
      email: 'john@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
    expect(user).to_not be_valid
  end
  describe 'associations' do
    it 'has many groups' do
      expect(User.reflect_on_association(:groups).macro).to eq(:has_many)
    end

    it 'has many entities' do
      expect(User.reflect_on_association(:entities).macro).to eq(:has_many)
    end
  end
end
