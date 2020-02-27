require 'rails_helper'

describe 'A User or Visitor' do
  it "can click on 'About' and learn about the application" do
    visit '/about'
    expect(current_path).to eq '/about'

    expect(first('.about').text).not_to be_empty
    expect(first('.how-to-navigate').text).not_to be_empty
    expect(first('.devs').text).not_to be_empty
  end 
end