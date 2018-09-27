class CreateTipoJuegos < ActiveRecord::Migration[5.2]
  def change
    create_table :tipo_juegos do |t|
      t.string :nombre_juego, null:false
      t.text :descripcion

      t.timestamps
    end
  end
end
