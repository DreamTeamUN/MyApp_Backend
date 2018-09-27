class CreateArchivoJuegos < ActiveRecord::Migration[5.2]
  def change
    create_table :archivo_juegos do |t|

      t.references :frase , foreign_key: true, null: false
      t.references :archivo , foreign_key: true, null: false

      t.timestamps
    end
  end
end
