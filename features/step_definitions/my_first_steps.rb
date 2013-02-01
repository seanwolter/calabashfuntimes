Given /^I am on the Player List$/ do
  wait_for(:timeout => 3) { query("tableView","delegate","description") }
end

When "I view the details for player $name" do |player_name|
	set_text("textField placeholder:'#{field_name}'", text_to_type)
end