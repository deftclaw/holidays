class CreateHolidayTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :holiday_types do |t|
      t.string :name , 

      t.timestamps
    end
    create_join_table :holidays , :holiday_types
  end
end
