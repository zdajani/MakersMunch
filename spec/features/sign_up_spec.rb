feature 'User sign up' do

  let(:user) do
    build(:user)
  end

  scenario 'as a new user' do
    sign_up(user)
    expect(page).to have_content("Welcome, #{user.full_name}")
  end

  scenario 'with a password that does not match' do
    user = create(:user)
    user2 = build(:user, password_confirmation: "wrong")
    sign_up(user2)
    expect(current_path).to eq('/user')
    expect(page).to have_content('Sorry, there were the following problems with the form.')
  end
end
