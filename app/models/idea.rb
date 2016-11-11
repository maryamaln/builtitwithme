class Idea < ApplicationRecord
  validates :title,  presence: true, length: { minimum: 2 }
  validates :description,  presence: true
  validates :skills_description,  presence: true
  validates :platform, :presence => true #password_confirmation attr
  belongs_to :user
  has_many :roles
  has_many :comments
end
