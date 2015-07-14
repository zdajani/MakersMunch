feature 'Adding tags' do

  let(:restaurant) do
    build(:restaurant)
  end

  let(:user) do
    create(:user)
  end
  before(:each) do
    log_in(user)
  end

  scenario 'I can add a tag to a Restaurant' do
    visit '/restaurant/new'
    new_restaurant(restaurant)
    restaurant = Restaurant.first
    expect(restaurant.tags.map(&:name)).to include('Sandwich')
  end

  scenario 'I can add multiple tags' do
    visit '/restaurant/new'
    new_restaurant(restaurant)
    restaurant = Restaurant.first
    expect(restaurant.tags.map(&:name)).to include('Sandwich')
    expect(restaurant.tags.map(&:name)).to include('FastFood')
  end
end
