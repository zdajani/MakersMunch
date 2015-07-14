feature 'User sign up' do

  let(:user) do
    build(:user)
  end

  scenario 'as a new user' do
    sign_up(user)
    expect(current_path).to eq('/')
  end

  scenario 'with a password that does not match' do
    user = create(:user)
    user2 = build(:user, password_confirmation: "wrong")
    sign_up(user2)
    expect(current_path).to eq('/user/new')
    expect(page).to have_content('Sorry, there were the following problems with the form.')
  end

  scenario 'with an email that is already registered' do
    sign_up(user)
    user_two = build(:user)
    expect { sign_up(user_two) }.to change(User, :count).by(0)
    expect(page).to have_content('Sorry, there were the following problems with the form.')
  end


end