class Tutorial < ApplicationRecord
    belongs_to :topic
    has_many :subjects, :dependent => :nullify
    has_one_attached :icon
    has_many_attached :figures
end
