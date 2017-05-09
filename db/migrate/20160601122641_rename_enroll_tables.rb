class RenameEnrollTables < ActiveRecord::Migration
  def self.up
    rename_table :enroll_tables, :enrolls
  end
  def self.down
    rename_table :enrolls, :enroll_tables
  end
end
