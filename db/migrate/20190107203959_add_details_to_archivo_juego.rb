class AddDetailsToArchivoJuego < ActiveRecord::Migration[5.2]
  def change
    change_table(:archivo_juegos) do |t|
      t.index [:archivo_id, :frase_id, :tipo_juego_id], unique: true, name: "archivo_frase_tipo_index"
    end
  end
end
