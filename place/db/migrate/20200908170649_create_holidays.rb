class CreateHolidays < ActiveRecord::Migration[6.0]
  def change
    create_table :holidays do |t|
      t.string :name
      t.text :description
      t.integer :country
      t.date :holiday_date
      t.string :states

      t.timestamps
    end
  end
end
