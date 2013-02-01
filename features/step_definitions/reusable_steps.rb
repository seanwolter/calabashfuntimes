#features from this guy:
#http://blog.saers.com/archives/2012/03/24/my-reusable-calabash-steps/

Given /^I press the "([^\"]*)" tableviewcell button$/ do |cell|
touch("tableViewCell button marked:'" + cell + "'")
end

Given /^I press the "([^"]*)" label$/ do |label|
touch("view label text:'#{label}'")
end

Then /^I enter "([^\"]*)" in the "([^\"]*)" (?:text|input) field$/ do |text_to_type, field_name|
set_text("textField placeholder:'#{field_name}'", text_to_type)
sleep(STEP_PAUSE)
end

Given /^I press the "([^"]*)" segment$/ do |label|
touch("segmentedControl segment marked:'#{label}'")
end

Given /^I see the text "([^"]*)" to the right of the text "([^"]*)"$/ do |right, left|
leftRect = query("label {text LIKE '#{left}*'} parent view:'PdfThumbnailView'", :frame)[0]
screenshot_and_raise "Text \"#{left}\" could not be found" if(leftRect == nil)
leftX = Integer(leftRect[/{(.*), (.*)}, {(.*), (.*)}/,1].split("{")[1])
leftY = Integer(leftRect[/{(.*), (.*)}, {(.*), (.*)}/,2])

rightRect = query("label {text LIKE '#{right}*'} parent view:'PdfThumbnailView'", :frame)[0]
screenshot_and_raise "Text \"#{right}\" could not be found" if(rightRect == nil)
rightX = Integer(rightRect[/{(.*), (.*)}, {(.*), (.*)}/,1].split("{")[1])
rightY = Integer(rightRect[/{(.*), (.*)}, {(.*), (.*)}/,2])

screenshot_and_raise "The following texts should be on the same horizontal line: \"#{left}\" \"#{right}\"" if(leftY != rightY)
screenshot_and_raise "The text \"#{right}\" is not to the right of the text \"#{left}\"" if(leftX >= rightX)
end

Given /^I see the text "([^"]*)" beneath the text "([^"]*)"$/ do |bottom, top|
bottomRect = query("label {text LIKE '#{bottom}*'} parent view:'PdfThumbnailView'", :frame)[0]
screenshot_and_raise "Text \"#{bottom}\" could not be found" if(bottomRect == nil)
bottomX = Integer(bottomRect[/{(.*), (.*)}, {(.*), (.*)}/,1].split("{")[1])
bottomY = Integer(bottomRect[/{(.*), (.*)}, {(.*), (.*)}/,2])

topRect = query("label {text LIKE '#{top}*'} parent view:'PdfThumbnailView'", :frame)[0]
screenshot_and_raise "Text \"#{top}\" could not be found" if(topRect == nil)
topX = Integer(topRect[/{(.*), (.*)}, {(.*), (.*)}/,1].split("{")[1])
topY = Integer(topRect[/{(.*), (.*)}, {(.*), (.*)}/,2])

screenshot_and_raise "The following texts should be on the same vertical line: \"#{top}\" \"#{bottom}\"" if(topX != bottomX)
screenshot_and_raise "The text \"#{bottom}\" is not beneath the text \"#{top}\"" if(topY >= bottomY)
end

Given /^I don't see the "([^"]*)" button$/ do |expected_mark|
res = query "button", :accessibilityLabel
index = res.find_index {|s| s == expected_mark}
screenshot_and_raise "Index should be nil (was: #{index})" if (index != nil)
end

Given /^I scroll to "([^"]*)"$/ do |searchText|
res = query "TableView index:1 TableViewCell label", :text
row = res.find_index {|s| s == searchText}
scroll_to_row :tableView, row
sleep(STEP_PAUSE)
end

Given /^given I import "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)"$/ do |datasource, maindir, subdir, file|
touch("tableViewCell label text:'All files'")
sleep(STEP_PAUSE)
touch("tableViewCell label text:'#{datasource}'")
macro %Q|I wait until I don't see "Loading..."|
touch("tableViewCell label text:'#{maindir}'")
macro %Q|I wait until I don't see "Loading..."|
touch("tableViewCell label text:'#{subdir}'")
macro %Q|I wait until I don't see "Loading..."|
touch("tableViewCell label text:'#{file}'")
sleep(STEP_PAUSE)
touch("tableViewCell label text:'All files'")
sleep(STEP_PAUSE)
end

Given /^given I import "([^"]*)", "([^"]*)", "([^"]*)"$/ do |datasource, maindir, file|
touch("tableViewCell label text:'All files'")
sleep(STEP_PAUSE)
touch("tableViewCell label text:'#{datasource}'")
macro %Q|I wait until I don't see "Loading..."|
touch("tableViewCell label text:'#{maindir}'")
macro %Q|I wait until I don't see "Loading..."|
touch("tableViewCell label text:'#{file}'")
sleep(STEP_PAUSE)
touch("tableViewCell label text:'All files'")
sleep(STEP_PAUSE)
end

Given /^I remove all my documents$/ do
docs = query("view:'PdfThumbnailView'")
docs.each do |pdfView|
touch("button marked:'EditCards'")
sleep(STEP_PAUSE)
touch("view:'PdfThumbnailView' index:0 button marked:'card function delete'")
sleep(STEP_PAUSE)
touch("button marked:'Delete file'")
sleep(STEP_PAUSE)
touch("button marked:'EditCards'")
sleep(STEP_PAUSE)
end
end

Given /^I remove all my folders$/ do
if(query("label marked:'My folders'").count > 0)
titleRect = query("label marked:'My folders' parent view", :frame)[0]
titleX = Integer(titleRect[/{(.*), (.*)}, {(.*), (.*)}/,1].split("{")[1])
titleY = Integer(titleRect[/{(.*), (.*)}, {(.*), (.*)}/,2])

count = query("tableViewCell").count
i = 0
while i < count do
cellRect = query("view:'FolderTableViewCell' index:#{i} view", :frame)[0]
cellX = Integer(cellRect[/{(.*), (.*)}, {(.*), (.*)}/,1].split("{")[1])
cellY = Integer(cellRect[/{(.*), (.*)}, {(.*), (.*)}/,2])
if(cellX == titleX && cellY > titleY)
touch("view:'FolderTableViewCell' index:#{i} view")
sleep(STEP_PAUSE)
touch("view:'FolderTableViewCell' index:#{i} button")
sleep(STEP_PAUSE)
touch("segmentedControl segment marked:'Delete folder'")
sleep(STEP_PAUSE)

break
end
i = i + 1
end
end

macro %Q|I remove all my folders| if(query("label marked:'My folders'").count > 0)
end

Given /^I playback recording "([^"]*)" at label "([^"]*)"$/ do |movie, label|
playback movie, {:query => "label text:'#{label}'"}
end