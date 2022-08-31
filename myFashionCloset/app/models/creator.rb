class Creator < ApplicationRecord
    belongs_to :user
    has_many :outfits
    has_many :follows
    has_many :reports
end
