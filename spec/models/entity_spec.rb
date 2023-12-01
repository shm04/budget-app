require 'rails_helper'

RSpec.describe Entity, type: :model do
  let(:user) do
    User.create(
      name: 'John Doe',
      email: 'john@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
  end

  let(:group) do
    Group.new(
      name: 'Fast Food',
      icon: 'imgexample.png',
      user_id: user.id
    )
  end

  it 'is valid with valid attributes' do
    group.save
    entity = Entity.new(
      name: 'Burger',
      amount: 1.5,
      author_id: user.id,
      group_id: group.id
    )
    expect(entity).to be_valid
  end

  it 'is not valid without a name' do
    entity = Entity.new(
      amount: 1.5,
      author_id: user.id,
      group_id: group.id
    )
    expect(entity).to_not be_valid
  end

  it 'is not valid without an amount' do
    entity = Entity.new(
      name: 'Burger',
      author_id: user.id,
      group_id: group.id
    )
    expect(entity).to_not be_valid
  end

  describe 'associations' do
    it 'belongs to user' do
      group.save
      entity = Entity.new(
        name: 'Burger',
        amount: 1.5,
        author_id: user.id,
        group_id: group.id
      )
      expect(entity.author_id).to eq(user.id)
    end

    it 'belongs to group' do
      group.save
      entity = Entity.new(
        name: 'Burger',
        amount: 1.5,
        author_id: user.id,
        group_id: group.id
      )
      expect(entity.group).to eq(group)
    end
  end
end
