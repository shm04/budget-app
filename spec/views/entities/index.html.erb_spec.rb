require 'rails_helper'

RSpec.describe 'entities/index', type: :view do
  let(:group) { create(:group, name: 'Sample Group') }
  let(:entities) { create_list(:entity, 3, group:) }
  let(:total_amount) { entities.sum(&:amount) }

  before do
    assign(:group, group)
    assign(:entities, entities)
    assign(:total_amount, total_amount)
    render
  end

  it 'displays group name and total amount' do
    expect(rendered).to have_selector('.total-amount p', text: 'Sample Group')
    expect(rendered).to have_selector('.total-amount p.amount', text: "$#{total_amount}")
  end

  it 'displays entity information for each entity' do
    entities.each do |entity|
      expect(rendered).to have_selector('.categories-container .cat-name', text: entity.name)
      expect(rendered).to have_selector('.categories-container .created-at',
                                        text: entity.created_at.strftime('%d %b %Y'))
      expect(rendered).to have_selector('.categories-container .amount', text: "$#{entity.amount}")
      expect(rendered).to have_selector('.categories-container .delete-btn', text: 'Delete')
    end
  end

  it 'displays a link to create a new transaction' do
    expect(rendered).to have_link('New Transaction', href: new_group_entity_path(group))
  end

  it 'displays a link to go back to the groups index' do
    expect(rendered).to have_link('Back', href: groups_path)
  end
end
