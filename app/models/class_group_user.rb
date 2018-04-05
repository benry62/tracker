class ClassGroupUser < ApplicationRecord
  belongs_to :user
  belongs_to :class_group
end
