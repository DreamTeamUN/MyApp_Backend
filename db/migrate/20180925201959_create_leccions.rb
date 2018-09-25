class CreateLeccions < ActiveRecord::Migration[5.2]
  def change
    create_table :leccions do |t|
      t.integer :semana

      t.timestamps
    end
  end
end
