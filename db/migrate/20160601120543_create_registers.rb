class CreateRegisters < ActiveRecord::Migration
  def change
    create_table :registers do |t|
      t.belongs_to :enroll, index: true, foreign_key: true
      t.belongs_to :course, index: true, foreign_key: true
      t.string :status

      t.timestamps null: false
    end
  end
end
