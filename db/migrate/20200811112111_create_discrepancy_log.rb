class CreateDiscrepancyLog < ActiveRecord::Migration[5.2]
  def change
    create_table :discrepancy_logs do |t|
      t.text :discrepancies

      t.timestamps null: false
    end
  end
end
