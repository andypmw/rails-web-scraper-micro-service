require 'capybara/rails'
require 'capybara/dsl'
require 'capybara/poltergeist'

class IndexWorker
  include Sidekiq::Worker
  include Capybara::DSL

  def perform(*args)
    Capybara.javascript_driver = :poltergeist

    visit args['page_url']

    page.all('h1').each do |element|
      Index_content.new(index_job_id: args['index_job_id'], type: 'h1', content: element.text).save!
    end

    page.all('h2').each do |element|
      Index_content.new(index_job_id: args['index_job_id'], type: 'h2', content: element.text).save!
    end

    page.all('h3').each do |element|
      Index_content.new(index_job_id: args['index_job_id'], type: 'h3', content: element.text).save!
    end

    page.all('a').each do |element|
      Index_content.new(index_job_id: args['index_job_id'], type: 'anchor', content: element['href']).save!
    end
  end
end
