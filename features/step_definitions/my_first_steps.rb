Given /^I am on the Player List$/ do
  wait_for(:timeout => 3) { query("tableView","delegate","description") }
end

When "I view the details for player $name" do |player_name|
	touch("label text:'#{player_name}' parent tableViewCell")
end

Then "I should be navigated to the Player Details screen"
	element_exists("view marked:'player location'")
end

And "I should see the coordinates $x,$y,$z" do |xVal,yVal,zVal|
	element_exists("view text:'X: #{xVal} Y: #{yVal} Z: #{zVal}'")
end