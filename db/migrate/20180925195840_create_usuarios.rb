class CreateUsuarios < ActiveRecord::Migration[5.2]
  def change
    create_table :usuarios do |t|
      t.integer :tipo_usuario
      t.string :nombre
      t.string :correo
      t.date :fecha_nacimiento
      t.date :fecha_registro
      t.integer :foto_perfil

      t.timestamps
    end
  end
end
