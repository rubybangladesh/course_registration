class UpdateTimestampsToRegisters < ActiveRecord::Migration
  def change
    change_column :registers, :created_at, :datetime, null: true
    change_column :registers, :updated_at, :datetime, null: true
  end
end
