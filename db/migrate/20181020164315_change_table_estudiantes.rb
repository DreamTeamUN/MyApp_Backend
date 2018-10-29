class ChangeTableEstudiantes < ActiveRecord::Migration[5.2]
  def self.up
    remove_column :estudiantes, :usuario_id, :integer
    add_column :estudiantes, :nombre, :string
    add_column :estudiantes, :fecha_nacimiento, :date
    add_reference :estudiantes, :archivo, foreign_key: true, default: 0
  end

  def self.down
    add_reference :estudiantes, :usuario, foreign_key: true
    remove_column :estudiantes, :nombre, :string
    remove_column :estudiantes, :fecha_nacimiento, :date
    remove_column :estudiantes, :archivo_id, :integer
  end
end
