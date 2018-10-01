class Post < ApplicationRecord
  belongs_to :user
  validates_presence_of :body, :expiration
  validates_length_of :body, maximum:140
  validate :expiration_date_cannot_be_in_the_past
  has_many :seens

  scope :not_expired, -> {where("expiration > ?", Time.now)}
  #scope :not_seen, -> (user_id){join('left join seens on seens.user_id = user_id and seens.post_id = posts.id').where(where(user_id: nil))}
  scope :not_seen, ->(user_id){where('(posts.id) NOT IN (SELECT seens.post_id FROM seens WHERE seens.user_id = ?)', user_id)}
  scope :not_expired_not_seen, ->(user_id){not_expired.not_seen(user_id)}

  private 

    def expiration_date_cannot_be_in_the_past
      if expiration.present? and expiration < Time.now
        errors.add(:expiration, "can't be in the past")
      end
    end

end