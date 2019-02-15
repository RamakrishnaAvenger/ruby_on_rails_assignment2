class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :project_name
      t.string :lead_name
      t.string :skills

      t.timestamps
    end
  end
end
