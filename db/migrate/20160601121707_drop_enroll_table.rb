class DropEnrollTable < ActiveRecord::Migration
  def up
    drop_table :enrolls
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
