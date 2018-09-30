class CreateArchivos < ActiveRecord::Migration[5.2]
  def change
    create_table :archivos do |t|

      t.string :nombre, null:false
      t.string :tipo_archivo, null: false, default: "archivo"
      t.string :extension, null:false
      t.string :ruta, null:false

    end
  end
end
