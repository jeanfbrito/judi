class CreateDocuments < ActiveRecord::Migration
  def change
    create_table(:documents) do |t|
      
      t.string  :name
      t.text    :description
      t.attachment :attachment
      t.integer :project_id
      t.integer :task_id

      t.timestamps
    end
  end
end