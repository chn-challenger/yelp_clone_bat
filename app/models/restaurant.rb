class Restaurant < ActiveRecord::Base
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :name, length: {minimum: 3}, uniqueness: true

  def user_review_on_restaurant(user)
    self.reviews.each do |review|
      return review if review.user_id == user.id
    end
    return nil
  end

  def create_review(params,user)
    self.reviews.create(thoughts: params["thoughts"], rating: params["rating"], user_id: user.id)
  end

  def average_rating
    return "N/A" if reviews.length == 0
    ave_rating = (reviews.inject(0){|r,x| r + x.rating} / reviews.length.to_f).round(0).to_i
    '★' * ave_rating  + '☆' * (5 - ave_rating)
  end
end
