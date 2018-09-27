class CreateArchivos < ActiveRecord::Migration[5.2]
  def change
    create_table :archivos do |t|
      t.string :nombre
      t.string :tipo_archivo
      t.string :nombre_archivo, null:false
      t.string :extension, null:false
      t.string :ruta_archivo, null:false

      t.timestamps
    end
  end
end
