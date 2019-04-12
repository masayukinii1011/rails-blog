class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :body
      t.references :post, foreign_key: true
      # postモデルに紐づく。外部キー。rails g時にpost:referencesで生成
      t.timestamps
    end
  end
end
