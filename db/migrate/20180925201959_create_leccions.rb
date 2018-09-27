class CreateLeccions < ActiveRecord::Migration[5.2]
  def change
    create_table :leccions do |t|
      t.integer :semana, null: false

      t.references :programa , foreign_key: true, null: false

      t.timestamps
    end
  end
end
