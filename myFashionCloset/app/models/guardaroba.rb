class Guardaroba < ApplicationRecord
    belongs_to :user
    has_many :capos
end
