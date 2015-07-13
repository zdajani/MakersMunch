def new_restaurant(restaurant)
  visit '/restaurant/new'
  fill_in 'name', with: restaurant.name
  fill_in 'post_code', with: restaurant.post_code
  fill_in 'tag', with: 'Sandwich FastFood'
  click_button 'Create'
end
