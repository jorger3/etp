class Factoredad < ActiveRecord::Base
  belongs_to :plans, class_name: 'Plan'
end
