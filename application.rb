class Application < ApplicationRecord
  belongs_to :user
  belongs_to :jobs
  validates :full_name, presence: true
  validates :head_title, presence: true
  validates :seen, presence: true
end
