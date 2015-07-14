feature 'User log out' do

  let(:user) do
    create(:user)
  end

  scenario 'while being logged in' do
    log_in(user)
    click_button 'Log Out'
    expect(current_path).to eq('/')
  end
end