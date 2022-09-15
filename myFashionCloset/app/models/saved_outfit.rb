class SavedOutfit < ApplicationRecord
    belongs_to :user
    belongs_to :outfit
end
