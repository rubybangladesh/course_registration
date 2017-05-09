module CurrentCourse
  extend ActiveSupport::Concern

  private

  def set_course
    @enroll = Enroll.find(session[:enroll_id])
  rescue ActiveRecord::RecordNotFound
    @enroll = Enroll.create
    session[:enroll_id] = @enroll.id
  end
end