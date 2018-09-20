class Tutorial < ApplicationRecord
    belongs_to :topic
    has_one_attached :icon
    has_many_attached :figures
end
