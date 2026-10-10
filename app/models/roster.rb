class Roster < ApplicationRecord
  validates :name, presence: {message: "can NOT be blank"}
  validates :name, uniqueness: {message: "has already been taken"}
end
