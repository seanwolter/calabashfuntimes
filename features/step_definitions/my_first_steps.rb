Given /^I am on the Player List$/ do
  wait_for(:timeout => 5) { query("tableView","delegate","description") }
end

When "I view the details for player $name" do |player_name|
#use wait_for instead of while loops. the last line is the BOOL that returns
	wait_for({:timeout => 10, 
 				:retry_frequency => 0.2,
				:post_timeout => 0.1,
				:timeout_message => "Timed out waiting...",
				:screenshot_on_error => true}) do
		step "I scroll down"
		element_exists("view label text:'#{player_name}'") #this is the BOOL for wait_for
	end
	touch("view label text:'#{player_name}'")
end

When "I should see the name $name" do |player_name|
	check_element_exists("view label text:'#{player_name}'")
end


Then "I should be navigated to the Player Details screen" do
	check_element_exists("view marked:'player location'")
end

And "I should see the coordinates $x,$y,$z" do |xVal,yVal,zVal|
	check_element_exists("view text:'X: #{xVal} Y: #{yVal} Z: #{zVal}'")
end

Then "I scroll $direction until I tap $name" do |direction, view_name|
#use wait_for instead of while loops. the last line is the BOOL that returns
	wait_for({:timeout => 10}) do
		step "I scroll #{direction}"
		element_exists("view label text:'#{view_name}'") #this is the BOOL for wait_for
	end
	touch("view label text:'#{view_name}'")
end