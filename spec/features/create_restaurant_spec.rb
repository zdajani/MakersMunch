feature 'Creating Restaurants' do

  let(:restaurant) do
    build(:restaurant)
  end

  let(:user) do
    create(:user)
  end
  before(:each) do
    log_in(user)
  end

  scenario 'I can create a restaurant' do
    visit '/restaurant/new'
    new_restaurant(restaurant)
    # expect(page).to have_content "#{restaurant.name}"
  end

  scenario 'error message displayed if post code added twice' do
    visit '/restaurant/new'
    new_restaurant(restaurant)
    visit '/restaurant/new'
    new_restaurant(restaurant)
    # expect(page).to have_content 'Restaurant already exists'
  end
end
