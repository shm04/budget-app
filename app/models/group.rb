class Group < ApplicationRecord
  has_many :entities, dependent: :destroy
end
