class CreateArchivoJuegos < ActiveRecord::Migration[5.2]
  def change
    create_table :archivo_juegos, id: false do |t|

      t.references :tipo_juego, foreign_key: true, null: false
      t.references :archivo , foreign_key: true, null: false
      t.references :frase , foreign_key: true

      t.timestamps
    end
  end
end
