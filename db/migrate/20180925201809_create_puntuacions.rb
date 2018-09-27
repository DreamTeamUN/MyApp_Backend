class CreatePuntuacions < ActiveRecord::Migration[5.2]
  def change
    create_table :puntuacions do |t|
      t.date :fecha, null:false
      t.integer :puntuacion_obtenida, null: false

      t.references :tipo_juego , foreign_key: true, null: false
      t.references :estudiante , foreign_key: true, null: false
      t.references :leccion , foreign_key: true, null: false

      t.timestamps
    end
  end
end
