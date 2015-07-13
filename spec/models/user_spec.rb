describe User do

  let(:user) do
    create(:user)
  end

  it 'adds a new user' do
      expect { user }.to change(User, :count).by(1)
  end

  it 'does not add the same user twice' do
    user_2 = build(:user)
    expect {user_2.save}.to change(User, :count).by(1)
  end

  it 'requires a matching confirmaiton password' do
    expect { build(:user, password_confirmation: 'incorrect') }.not_to change(User, :count)
  end

  it 'authenticates when given a valid email and password' do
    authenticated_user = User.authenticate(email: user.email, password: user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given a wrong email' do
    authenticated_user = User.authenticate(email: 'wrong', password: user.password)
    expect(authenticated_user).to be_nil
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(email: user.email, password: 'incorrect')).to be_nil
  end

end
