class Bank < ActiveRecord::Base
  validates_presence_of :name

  self.per_page = 5
end
