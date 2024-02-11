require "selenium-webdriver"

class ScreenshotJob < ApplicationJob
  include Rails.application.routes.url_helpers
  queue_as :default

  def perform(goal_id)
    goal = Goal.find(goal_id)

    # 1. set up Selenium
    driver = Selenium::WebDriver.for :chrome

    # 2. navigate to your site
    driver.navigate.to goal_url(goal)
    file_path = "tmp/#{SecureRandom.uuid}-screenshot.png"
    # 3. take a screenshot and save it to a file
    driver.save_screenshot(file_path)

    # 4. quit Selenium
    driver.quit

    date = Time.zone.now.strftime("%m-%d-%Y")

    File.open(file_path) do |local_file|
      goal.wallpaper.attach(io: local_file, filename: "motivation-wallpaper-#{date}.png")
    end

    File.delete(file_path)
  end

  private
  
  def default_url_options
    { host: "localhost:3000" }
  end
end
