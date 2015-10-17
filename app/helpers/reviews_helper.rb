module ReviewsHelper
  def leave_review(user, thoughts, rating)
    sign_in(user)
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in 'Thoughts', with: thoughts
    select rating, from: 'Rating'
    click_button 'Leave Review'
  end

end
