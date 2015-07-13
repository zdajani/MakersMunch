feature 'Creating Restaurants' do

  let(:restaurant) do
    build(:restaurant)
  end

  scenario 'I can create a restaurant' do
    visit '/restaurant/new'
    new_restaurant(restaurant)
    expect(page).to have_content "#{restaurant.name}"
  end
end