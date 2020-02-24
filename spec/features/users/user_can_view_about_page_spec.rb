require 'rails_helper'

describe 'A User or Visitor' do
  it "can click on 'About' and learn about the application" do
    # visit '/'
    # click_on 'About'
    visit '/about'
    expect(current_path).to eq '/about'
    expect(".about").to_not be_empty
    expect(".how-to-navigate").to_not be_empty
    expect(".devs").to_not be_empty
  end 
end 