class Plan < ActiveRecord::Base
  has_many :factoredads, class_name: 'Factoredad'
end
