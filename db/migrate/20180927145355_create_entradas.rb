class CreateEntradas < ActiveRecord::Migration[5.2]
  def change
    create_table :entradas do |t|

      t.boolean :publicado, null: false, default: false
      t.boolean :abierto, null: false, default: false
      t.integer :ramificacion, null: false, default: 0

      t.references :archivo , foreign_key: true, null: false #Dirige al HTML que muestra la entrada
      t.references :entrada , foreign_key: true, null: true #Dirige a la entrada padre
      t.references :nivel_acceso , foreign_key: true, null: false
      t.references :usuario , foreign_key: true, null: false #Autor de la entrada

      t.timestamps
      
    end
  end
end
