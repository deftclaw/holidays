class Holiday < ApplicationRecord
  enum country: ['AU','CA','US']
  has_and_belongs_to_many :holiday_types

end
