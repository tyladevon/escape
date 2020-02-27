feature 'User can click my trips link and be redirected to my profile' do
  scenario "Successful - user" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit '/about'
    click_on 'My Trips'
    expect(current_path).to eq '/profile'
  end
  scenario 'Not Successful - visitor' do
    visit '/about'
    expect(page).not_to have_link 'My Trips'
  end
end

feature 'User can click my name and be redirected to my profile' do
  scenario "Successful - user" do
    user = create(:user, first_name: "Ryan")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit '/about'
    click_on "Hi, #{user.first_name}"
    expect(current_path).to eq '/profile'
  end
end