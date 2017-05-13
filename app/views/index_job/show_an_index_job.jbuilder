json.index_job do
  json.id @job.id.to_s
  json.page_url @job.page_url
  json.status @job.status
  json.created_at @job.created_at
  json.updated_at @job.updated_at
end

json.contents @job.index_job_contents do |c|
  json.type c.type
  json.content c.content
end
