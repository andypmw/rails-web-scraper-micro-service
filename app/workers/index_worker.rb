require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'
require 'uri'

class IndexWorker
  include Sidekiq::Worker
  include Capybara::DSL

  def perform(customer_id, index_job_id)
    index_job = Customer.find(customer_id).index_jobs.find(index_job_id)
    uri = URI(index_job.page_url)

    Capybara.current_driver = :poltergeist
    Capybara.run_server = false
    if uri.scheme.nil?
      Capybara.app_host = "http://#{uri.host}" 
    else
      Capybara.app_host = "#{uri.scheme}://#{uri.host}"
    end

    page.driver.headers = { "User-Agent" => "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36" }

    visit "#{uri.path}#{uri.query}#{uri.fragment}"



    content_order = 1

    page.all('h1').each do |element|
      content_order += 1
      IndexJobContent.new(
        index_job_customer_id: customer_id, 
        index_job_id: index_job_id,
        content_order: content_order.next,
        type: :h1, 
        content: element.text
      ).save!
    end

    page.all('h2').each do |element|
      content_order += 1
      IndexJobContent.new(
        index_job_customer_id: customer_id, 
        index_job_id: index_job_id,
        content_order: content_order.next,
        type: :h2, 
        content: element.text
      ).save!
    end

    page.all('h3').each do |element|
      content_order += 1
      IndexJobContent.new(
        index_job_customer_id: customer_id, 
        index_job_id: index_job_id,
        content_order: content_order.next,
        type: :h3, 
        content: element.text
      ).save!
    end

    page.all('a').each do |element|
      content_order += 1
      IndexJobContent.new(
        index_job_customer_id: customer_id, 
        index_job_id: index_job_id,
        content_order: content_order.next,
        type: :anchor, 
        content: element['href']
      ).save!
    end


    if page.status_code == '200'
      index_job.status = :success
    else
      index_job.status = :fail
    end
    index_job.save!
  end
end
