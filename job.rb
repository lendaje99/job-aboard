class Job < ApplicationRecord
    validates :title, presence: true
    validates :desc, presence: true
end
