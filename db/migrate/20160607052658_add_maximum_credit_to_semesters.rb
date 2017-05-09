class AddMaximumCreditToSemesters < ActiveRecord::Migration
  def change
    add_column :semesters, :maximum_credit, :decimal, default: 5.00
  end
end
