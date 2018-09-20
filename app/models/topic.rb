class Topic < ApplicationRecord
    has_many :tutorials, :dependent => nullify
    has_one_attached :icon
end
