def new_restaurant(restaurant)
  visit '/restaurant/new'
  fill_in 'name', with: restaurant.name
  select('Sandwich', :from => 'tag1')
  select('Fast Food', :from => 'tag2')
  click_button 'Create'
end
