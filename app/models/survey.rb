class Survey < ActiveRecord::Base
  attr_protected :user_id
  belongs_to :user
  has_many :questions, :dependent => :destroy
  accepts_nested_attributes_for :questions, :reject_if => lambda {|a| a[:content].blank?}, :allow_destroy => true

	has_many :assignments
	has_many :assignees, :through => :assignments, :source => :user
	has_many :histories

  has_many :answers, through: :questions, source: :answers
end
