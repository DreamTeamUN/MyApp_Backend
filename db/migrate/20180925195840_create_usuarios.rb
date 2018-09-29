class CreateUsuarios < ActiveRecord::Migration[5.2]
  def change
    create_table :usuarios do |t|

      t.string :user, null: false
      t.string :password, null: false
      t.string :nombre, null: false
      t.string :correo, null: false
      t.date :fecha_nacimiento

      t.references :tipo_usuario, foreign_key: true, null:false
      t.references :archivo , foreign_key: true, default: -1 #Archivo para la foto de perfil

      t.timestamps
      
    end
  end
end
