class Subject < ApplicationRecord
    belongs_to :tutorial
    has_many_attached :figures
end
