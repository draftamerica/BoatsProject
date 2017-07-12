module Locations
    extend ActiveSupport::Concern

    def self.list
        ["Tokyo",
        "Beijing",
        "Seattle",
        "London",
        "Paris",
        "Miami",
        "New York",
        "Philadelphia",
        "Berlin",
        "Oslo"]

    end

end
