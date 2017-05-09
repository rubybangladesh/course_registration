class RenameColumnName < ActiveRecord::Migration
  def self.up
    rename_column :courses, :course_id, :course_no
  end
end
