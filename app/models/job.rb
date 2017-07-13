class Job < ApplicationRecord
    has_many :boats_jobs
    has_many :boats, through: :boats_jobs
    has_many :comments
    belongs_to :user

    validates :destination, inclusion: { in: Locations.list,
    message: "Invalid destination" }
    validates :origin, inclusion: { in: Locations.list,
    message: "Invalid origin" }
    validates :cost, numericality: { greater_than: 1000 }
    validates :description, length: {minimum: 50}

    validate :origin_different_from_destination

    def origin_different_from_destination
        if origin == destination
            errors.add(:destination, "must be different from origin")
        end
    end

end
