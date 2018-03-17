
require "rails_helper"

RSpec.feature "User submits a link" do 
	scenario "they see the page for submitted link" do 
		link_title = "bowling"
		link_url = "http://localhost:3000"

		visit root_path
		fill_in "link_title", with: link_title
		fill_in "link_url", with: link_url
		click_on "Submit!"

		expect(page).to have_link link_title, href: link_url
	end
end