class Entity < ApplicationRecord
  belongs_to :group, foreign_key: 'group_id', class_name: 'Group'
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
end
