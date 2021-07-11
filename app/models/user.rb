class User < ApplicationRecord
  has_many :flashcards
  has_many :subjects, through: :flashcards

  validates :username, uniqueness: true, presence: true
end
