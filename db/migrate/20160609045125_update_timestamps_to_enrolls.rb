class UpdateTimestampsToEnrolls < ActiveRecord::Migration
  def change
    change_column :enrolls, :created_at, :datetime, null: true
    change_column :enrolls, :updated_at, :datetime, null: true
  end
end
