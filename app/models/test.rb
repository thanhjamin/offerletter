class Test < ActiveRecord::Base
  has_many :report_cards
  #has_many :users, through: :report_cards
  has_many :questions
  accepts_nested_attributes_for :questions
end
