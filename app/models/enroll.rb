class Enroll < ActiveRecord::Base
  before_create :semester_check
  before_save :credit_check

  belongs_to :user
  belongs_to :semester

  has_many :registers
  has_many :courses, through: :registers


  accepts_nested_attributes_for :registers
  accepts_nested_attributes_for :courses

  protected

  def semester_check
    begin
      current_semester = Semester.find_by_status("Current").id
      semester = Enroll.where(user_id: self.user_id, semester_id: current_semester)
      if semester.present?
        self.errors.add(:base, 'Already Registered!!')
        return false

      else
        return true

      end
    end
  end

  def credit_check
    total = 0
    course_ids = self.course_ids
    courses = Course.where(id: course_ids)
    courses.each do |course|
      credit = course.credit
      total += credit
    end
    semester_id = self.semester_id
    @maximum_credit = Semester.find_by(semester_id).maximum_credit
    #@maximum_credit = 2.00
    if total > @maximum_credit
      self.errors.add(:base, 'Maximum Credit Exceeded!!')
      return false
    else
      return true
    end
  end
end

