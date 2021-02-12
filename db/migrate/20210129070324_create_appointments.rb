class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.boolean :completed
      t.references :user, foreign_key: true
      t.integer :doctor_id
      t.integer :treatment_id

      t.timestamps
    end
    add_index :appointments, :doctor_id
    add_index :appointments, :treatment_id
  end
end
