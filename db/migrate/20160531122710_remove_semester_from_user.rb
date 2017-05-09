class RemoveSemesterFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :semester, :integer
  end
end
