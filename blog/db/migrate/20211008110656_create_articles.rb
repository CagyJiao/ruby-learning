class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body

      # defines two additional columns: created_at, updated_at
      t.timestamps
    end
  end
end
