class AddPersonRefToArticle < ActiveRecord::Migration[7.0]
  def change
    add_reference :articles, :person, null: false, foreign_key: true
  end
end
