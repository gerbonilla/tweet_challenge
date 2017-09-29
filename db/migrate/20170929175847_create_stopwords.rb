class CreateStopwords < ActiveRecord::Migration[5.1]
  def change
    create_table :stopwords do |t|
      t.string :text

      t.timestamps
    end
  end
end
