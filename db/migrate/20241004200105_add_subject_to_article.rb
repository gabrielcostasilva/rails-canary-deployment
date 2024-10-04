class AddSubjectToArticle < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :subject, :string
  end
end
