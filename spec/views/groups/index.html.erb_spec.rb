require 'rails_helper'

RSpec.describe 'groups/index', type: :view do
  let(:user) { create(:user, name: 'John Doe') }
  let!(:groups) { create_list(:group, 3, user:) }

  before do
    assign(:groups, groups)
    allow(view).to receive(:current_user).and_return(user)
    render
  end

  it 'displays user name' do
    expect(rendered).to have_selector('.total-amount p', text: 'John Doe')
  end

  it 'displays group information for each group' do
    groups.each do |group|
      expect(rendered).to have_selector('.categories-container .cat-name', text: group.name)
      expect(rendered).to have_selector('.categories-container .created-at',
                                        text: group.created_at.strftime('%d %b %Y'))
      expect(rendered).to have_selector('.categories-container .amount', text: "$#{group.entities.sum(:amount)}")
      expect(rendered).to have_selector('.categories-container .delete-btn', text: 'Delete')
    end
  end

  it 'displays a link to add a new category' do
    expect(rendered).to have_link('Add a new category', href: new_group_path)
  end
end
