feature 'User log out' do

  let(:user) do
    create(:user)
  end

  scenario 'while being logged in' do
    log_in(user)
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
  end

end
