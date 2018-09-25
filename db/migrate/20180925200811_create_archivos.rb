class CreateArchivos < ActiveRecord::Migration[5.2]
  def change
    create_table :archivos do |t|
      t.string :nombre
      t.string :tipo_archivo
      t.string :nombre_archivo
      t.string :extension
      t.string :ruta_archivo

      t.timestamps
    end
  end
end
