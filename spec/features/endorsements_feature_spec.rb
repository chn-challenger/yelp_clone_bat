require 'rails_helper'

feature 'endorsing reviews' do

  scenario 'a user can endorse a review, which updates the review endorsement count', js: true do
    kfc = Restaurant.create(name: 'KFC')
    kfc.reviews.create(rating: 3, thoughts: 'It was an abomination')
    user = create(:user)
    sign_in(user)
    visit '/restaurants'
    click_link 'Endorse Review' #are we endorsing restaurants or the review of the restaurants?
    expect(page).to have_content('1 endorsement')
  end

end
