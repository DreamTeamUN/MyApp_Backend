class CreatePuntuacions < ActiveRecord::Migration[5.2]
  def change
    create_table :puntuacions do |t|
      t.date :fecha
      t.integer :puntuacion_obtenida

      t.timestamps
    end
  end
end
