feature 'viewing restaurants' do

  let(:restaurant) do
    build(:restaurant)
  end
  before(:each) do
    Restaurant.create(name: 'Subway',
                      place_id: 'SW3',
                      tags: [Tag.first_or_create(name: 'Sandwich')])
    Restaurant.create(name: 'Pizza Hut',
                      place_id: 'SW4',
                      tags: [Tag.first_or_create(name: 'Italian Pizza')])
  end

  it 'can filter restaurants by tag' do
    visit '/tags/Sandwich'
    expect(page).not_to have_content('Pizza Hut')
    expect(page).to have_content('Subway')
  end

end
