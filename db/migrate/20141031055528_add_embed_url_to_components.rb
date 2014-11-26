class AddEmbedUrlToComponents < ActiveRecord::Migration
  def change
    add_column :components, :embed_url, :string
  end
end
