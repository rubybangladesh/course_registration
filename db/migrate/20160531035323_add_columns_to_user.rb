class AddColumnsToUser < ActiveRecord::Migration
  def change
      add_column :users, :roll, :integer
      add_column :users, :first_name, :string
      add_column :users, :last_name, :string
      add_column :users, :semester, :integer
  end
end
