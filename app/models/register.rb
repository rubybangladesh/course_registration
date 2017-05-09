class Register < ActiveRecord::Base
  belongs_to :course
  belongs_to :enroll

  accepts_nested_attributes_for :course
  #accepts_nested_attributes_for :enroll




end
