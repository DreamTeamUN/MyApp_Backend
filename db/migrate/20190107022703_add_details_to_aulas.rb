class AddDetailsToAulas < ActiveRecord::Migration[5.2]

  def change
    add_column :aulas, :nombre, :string
    add_column :aulas, :descripcion, :string, default: ""
    add_index  :aulas, :nombre, unique: true
  end

end
