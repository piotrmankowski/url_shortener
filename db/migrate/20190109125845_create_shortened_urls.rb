class CreateShortenedUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_urls do |t|
      t.text :original_url, null: false
      t.text :sanitized_url, null: false

      t.timestamps
    end
  end
end
