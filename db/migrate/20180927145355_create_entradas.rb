class CreateEntradas < ActiveRecord::Migration[5.2]
  def change
    create_table :entradas do |t|
      t.datetime :fecha_publicacion, null: false
      t.boolean :publicado, null: false, default: false
      t.boolean :abierto, null: false, default: false
      t.integer :ramificacion, null: false, default: 0

      t.references :archivo , foreign_key: true, null: false
      t.references :entrada , foreign_key: true, null: false #Cambiar el nombre a padre
      t.references :nivel_acceso , foreign_key: true, null: false
      t.references :usuario , foreign_key: true, null: false

      t.timestamps
    end
  end
end
