class Creator < ApplicationRecord
    belongs_to :user
    has_many :outfits
    has_many :follows
    has_many :followingUsers, through: :follows, source: :user
    has_many :reports
end
