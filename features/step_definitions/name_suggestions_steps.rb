Given("I have not yet generated any names") do
    all('h1', count: 2)
end

Given("I have entered a male first name") do
    fill_in('firstname', with: "Daniel")
end

Given("I leave Use Nickname selected") do
    find_field('shorten', with: 'Yes')
end

When("I request a male rap name") do
    click_on('Suggest Male Rap Name')
end

Then("I see the generated name at the top of the list of names") do
    find('h2', text: 'Your rap name is:').sibling('div').all('h1', count: 1)
end

Then("I see a shortened nickname and not my full first name") do
    all('h1', count: 2)[1].assert_no_text('Daniel')
end

Given("I have entered a female first name") do
    fill_in('firstname', with: "Danielle")
end

Given("I have entered a last initial") do
    fill_in('lastinitial', with: 'F')
end

Given("I have de-selected Use Nickname") do
    uncheck('shorten')
end

When("I request a female name") do
    click_on('Suggest Female Rap Name')
end

Then("I see a female name appear at the top of the list containing my first name, initials, or first initial") do
    name = find('h2', text: 'Your rap name is:').sibling('div').all('h1', count: 1)[0]
    assert_node_contains_strings(name, ['danielle', 'df', 'd'])
end

When("I request a female name a second time with the same settings") do
    click_on('Suggest Female Rap Name')
end

Then("I see a different name appear above the old name still containing my full first name") do
    new_name = find('h2', text: 'Your rap name is:').sibling('div').all('h1', count: 1)[0]
    old_name = find('h2', text: 'Your rap name is:').sibling('div').all('tr')[1].all('div')[0]
    assert_node_contains_strings(new_name, ['danielle', 'df', 'd'])
    new_name.assert_no_text(old_name.text)
end

Then("I see an error message saying a first name is required") do
    page.assert_text("You must enter your first name.")
end

Given("I have not entered a first or last name") do
    find_field('firstname', with: nil)
    find_field('lastinitial', with: nil)
end

# Helper Methods

def assert_node_contains_strings(node, strings)
    cleaned_text = node.text.gsub(' ', '').downcase
    unless strings.any? {|string| cleaned_text.include?(string) }
        raise "Node's text ('#{cleaned_text}') did not include string '#{string}''"
    end
end