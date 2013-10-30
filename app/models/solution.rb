class Solution < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  accepts_nested_attributes_for :solution
end
