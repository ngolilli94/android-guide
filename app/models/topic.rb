class Topic < ApplicationRecord
    has_many :tutorials, :dependent => nullify
end
