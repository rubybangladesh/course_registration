class Course < ActiveRecord::Base
  validates_presence_of :course_no, :course_title, :credit, :semester, :message => "Can't be empty"
  validates_uniqueness_of :course_no, :message => "Already Exists"
  validates :credit, numericality: {greater_than_or_equal_to: 0.75}

  has_many :registers
  has_many :enrolls, through: :registers

  def course_title_with_credit
    [course_title, credit].compact.join(' ')
  end


  #
  # before_destroy :ensure_not_referneced_by_any_line_item
  #
  # private
  #
  # def ensure_not_referneced_by_any_line_item
  #   if line_items.empty?
  #     return true
  #   else
  #     errors.add(:base, 'Line Items present')
  #     return false
  #   end
  # end
end
