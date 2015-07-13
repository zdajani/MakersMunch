def sign_up(user)
  visit '/user/new'
  fill_in :full_name, with: user.full_name
  fill_in :email, with: user.email
  fill_in :password, with: user.password
  fill_in :password_confirmation, with: user.password_confirmation
  click_button 'Sign up'
end
