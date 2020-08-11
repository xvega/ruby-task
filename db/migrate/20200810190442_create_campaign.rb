class CreateCampaign < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.string :job_id, null: false
      t.integer :status, null: false
      t.string :external_reference, null: false
      t.text :ad_description, null: false

      t.timestamps null: false
    end
  end
end
