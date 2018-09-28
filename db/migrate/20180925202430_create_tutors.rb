class CreateTutors < ActiveRecord::Migration[5.2]
  def change
    create_table :tutors, id: false do |t|

      t.references :usuario , foreign_key: true, null: false

      t.timestamps
    end
  end
end
