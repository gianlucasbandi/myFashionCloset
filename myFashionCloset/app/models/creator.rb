class Creator < ApplicationRecord
    belongs_to :user
    has_many :outfits, dependent: :destroy
    has_many :follows, dependent: :destroy
    has_many :followingUsers, through: :follows, source: :user, dependent: :destroy
    has_many :reports, dependent: :destroy
end
