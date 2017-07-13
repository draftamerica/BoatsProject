class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :job
    validates :comment, length: {minimum: 1}
end
