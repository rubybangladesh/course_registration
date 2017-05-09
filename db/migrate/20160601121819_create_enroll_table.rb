class CreateEnrollTable < ActiveRecord::Migration
  def change
    create_table :enroll_tables do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :semester, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
