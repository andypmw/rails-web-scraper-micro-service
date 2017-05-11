class CreateIndexJobContents < ActiveRecord::Migration[5.0]
  def change
    create_table :index_job_contents do |t|
      t.string :name
    end
  end
end
