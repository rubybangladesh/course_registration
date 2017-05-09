class CombineCoursesInCart < ActiveRecord::Migration
  def up
    Enroll.all.each do |enroll|
        sums = enroll.line_items.group(:course_id).sum(:quantity)

    sums.each do |course_id, quantity|
      if quantity > 1
        enroll.line_items.where(course_id: course_id).delete_all
        item = enroll.line_items.build(course_id: course_id)
        item.quantity = quantity
        item.save!
      end
    end
   end
  end

  def down
    LineItem.where("quantity>1").each do |line_item|
      line_item.quantity.times do
        LineItem.create enroll_id: line_item.enroll_id, course_id: line_item.course_id, quantity: 1
      end

      line_item.destroy
    end
  end
end
