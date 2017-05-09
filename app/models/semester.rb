class Semester < ActiveRecord::Base
  before_save :status_check
  has_many :enrolls
  has_many :users, through: :enrolls

  validates_presence_of :sem_name, :status, :message => "Can't be empty"
  validates_uniqueness_of :sem_name, :message => "Already exists"

  STATUS = ['Done', 'Current', 'Due']

  scope :current, ->{ where(status: 'current')}

  protected

  def status_check
    if self.status_changed? && self.status == "Current"
      @prev = Semester.find_by_status("Current")
      if @prev != nil
        @prev.update_attribute(:status, "Done")
      end
    end
  end
end
