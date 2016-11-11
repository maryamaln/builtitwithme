class CreateIdeas < ActiveRecord::Migration[5.0]
  def change
    create_table :ideas do |t|
    	t.string    :title,        null: false
    	t.text     	:description, null: false
    	t.text			:skills_description,	null: false
    	t.string		:platform, null: false
      t.string    :help_needed, null: false
    	t.integer   :user_id,            null: false
      t.timestamps
    end
  end
end
