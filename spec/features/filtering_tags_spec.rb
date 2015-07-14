feature 'filtering selected tags' do

  before(:each) do
    Restaurant.create(name: 'Pizza Hut',
                      place_id: 'SW4',
                      tags: [Tag.first_or_create(name: 'Pizza')])
  end

  it 'can filter restaurants from drop down' do
    visit '/dropdown'
    select("Pizza", :from => "food_tags")
    click_button 'Find!'
    # expect(page).to have_content('Pizza Hut')
  end
end
