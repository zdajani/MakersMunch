describe User do

  it 'adds a new user' do
      expect { create(:user) }.to change(User, :count).by(1)
  end
  
end
