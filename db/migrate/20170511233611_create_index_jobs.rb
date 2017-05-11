class CreateIndexJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :index_jobs do |t|
      t.string :name
    end
  end
end
