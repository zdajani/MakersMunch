feature 'User log in' do

 scenario 'with correct credentials' do
   user = create(:user)
   log_in(user)
   expect(current_path).to eq('/')
 end

  scenario 'with an incorrect credentials' do
    user = build(:user, email: "wrong")
    log_in(user)
    expect(page).to have_content "Sorry, there were the following problems with the form."
    end
end
