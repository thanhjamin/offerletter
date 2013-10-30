class Question < ActiveRecord::Base
  belongs_to :test
  has_one :solution
  #has_many: :through
end
