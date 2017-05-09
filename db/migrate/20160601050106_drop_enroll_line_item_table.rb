class DropEnrollLineItemTable < ActiveRecord::Migration
  def up
    drop_table :enrolls
    drop_table :line_items
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
