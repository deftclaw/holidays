class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.date :birthday
      t.string :publisher

      t.timestamps
    end
  end
end
