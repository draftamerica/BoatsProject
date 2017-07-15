class Boat < ApplicationRecord
    has_many :boats_jobs
    has_many :jobs, through: :boats_jobs
    has_many :photos
    belongs_to :user

    validates :name, uniqueness: { case_sensitive: false }
    validates :location, inclusion: { in: Locations.list,
    message: "Invalid location" }

    accepts_nested_attributes_for :boats_jobs
end
