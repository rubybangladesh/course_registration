class CreateEnrolls < ActiveRecord::Migration
  def change
    create_table :enrolls do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :course, index: true, foreign_key: true
      t.belongs_to :semester, index: true, foreign_key: true
      t.string :status

      t.timestamps null: false
    end
  end
end
