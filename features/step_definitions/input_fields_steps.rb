Given("I am on the homepage") do
    find('h1', :text => "Welcome to MyRapName.com")
end

Then("I see an input field for my first name") do
    find_field('firstname')
end

Then("I see an input field for my last initial") do
    find_field('lastinitial')  
end

Then("I do not see values in the input fields") do
    find_field('firstname', with: nil)
    find_field('lastinitial', with: nil)
end

Then("I can enter text in the first name field") do
    fill_in('firstname', with: "Text")
    find_field('firstname', with: "Text")
end

Then("I can enter text in the last initial field") do
    fill_in('lastinitial', with: "T")
    find_field('lastinitial', with: "T")
end