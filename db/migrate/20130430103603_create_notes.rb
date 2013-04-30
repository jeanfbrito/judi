class CreateNotes < ActiveRecord::Migration
    def change
    create_table(:notes) do |t|
      
      t.string    :title
      t.text      :body
      t.integer   :project_id
      t.integer   :task_id

      t.timestamps
    end
  end
end