class FixUsuarioColumna < ActiveRecord::Migration[5.2]
  def self.up
    rename_column :usuarios, :password, :password_digest
    rename_column :usuarios, :correo,   :email
  end

  def self.down
    rename_column :usuarios, :password_digest, :password
    rename_column :usuarios, :email, :correo
  end
end
