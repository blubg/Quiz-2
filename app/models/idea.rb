class Idea < ActiveRecord::Base

  validates :body, presence: {message: "must be entered"}
  validates :title, presence: {message: "must be entered"}

  has_many :comments, dependent: :destroy

  has_many :memberships, dependent: :destroy


end
