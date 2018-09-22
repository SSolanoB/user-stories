class Post < ApplicationRecord
  belongs_to :user
  #validates :body, length: { maximum:140 }, presence: true
  #validates :expiration, presence: true
  validates_presence_of :body, :expiration
  validates_length_of :body, maximum:140
end
