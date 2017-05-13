# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Customer.new(
  id: 'ebed9c93-a0ce-4bc6-af4c-7aeee358c6a7',
  name: 'Andy Primawan',
  key_id: 'OWwmYexkWXxAjyXS6PVO',
  key_secret: 'TO5nfc9A7tT0dpEbScsr',
  is_active: true
).save!

IndexJob.new(
  customer_id: 'ebed9c93-a0ce-4bc6-af4c-7aeee358c6a7',
  id: 'da8b8c2c-b6f0-4cce-8b16-697be7a65e21',
  page_url: 'https://www.itb.ac.id',
  status: :success
).save!

IndexJobContent.new(
  index_job_customer_id: 'ebed9c93-a0ce-4bc6-af4c-7aeee358c6a7',
  index_job_id: 'da8b8c2c-b6f0-4cce-8b16-697be7a65e21',
  content_order: 1,
  type: :h1,
  content: 'Institut Teknologi Bandung'
).save!

IndexJobContent.new(
  index_job_customer_id: 'ebed9c93-a0ce-4bc6-af4c-7aeee358c6a7',
  index_job_id: 'da8b8c2c-b6f0-4cce-8b16-697be7a65e21',
  content_order: 2,
  type: :h2,
  content: 'News'
).save!

IndexJobContent.new(
  index_job_customer_id: 'ebed9c93-a0ce-4bc6-af4c-7aeee358c6a7',
  index_job_id: 'da8b8c2c-b6f0-4cce-8b16-697be7a65e21',
  content_order: 3,
  type: :h3,
  content: 'Military Tank by Undergraduates'
).save!

IndexJobContent.new(
  index_job_customer_id: 'ebed9c93-a0ce-4bc6-af4c-7aeee358c6a7',
  index_job_id: 'da8b8c2c-b6f0-4cce-8b16-697be7a65e21',
  content_order: 4,
  type: :anchor,
  content: 'https://ui.ac.id'
).save!

IndexJobContent.new(
  index_job_customer_id: 'ebed9c93-a0ce-4bc6-af4c-7aeee358c6a7',
  index_job_id: 'da8b8c2c-b6f0-4cce-8b16-697be7a65e21',
  content_order: 5,
  type: :anchor,
  content: 'https://ugm.ac.id'
).save!

IndexJobContent.new(
  index_job_customer_id: 'ebed9c93-a0ce-4bc6-af4c-7aeee358c6a7',
  index_job_id: 'da8b8c2c-b6f0-4cce-8b16-697be7a65e21',
  content_order: 6,
  type: :anchor,
  content: 'https://unpad.ac.id'
).save!
