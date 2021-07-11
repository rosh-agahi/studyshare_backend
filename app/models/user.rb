class User < ApplicationRecord
  has_many :flashcards
  has_many :subjects, through: :flashcards

  validates :username, presence: true
  validates :username, uniqueness: { case_sensitive: true }

  def self.authenticate(username_input)
    self.all.where(username: username_input) > 0
  end

end
