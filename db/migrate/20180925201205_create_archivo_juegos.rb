class CreateArchivoJuegos < ActiveRecord::Migration[5.2]
  def change
    create_table :archivo_juegos do |t|

      t.timestamps
    end
  end
end
