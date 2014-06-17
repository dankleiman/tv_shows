require 'rails_helper'

feature 'user adds characters to a show', %Q{
  As a site visitor
  I want to add my favorite TV show characters
  So that other people can enjoy their crazy antics
} do

# Acceptance Criteria:
# * I can access a form to add a character on a TV show's page
# * I must specify the character's name and the actor's name
# * I can optionally provide a description
# * If I do not provide the required information, I receive an error message
# * If the character already exists in the database, I receive an error message

  it 'adds a character' do
    attrs = {
        title: 'Game of Thrones',
        network: 'HBO',
        years: '2011-',
        synopsis: 'Seven noble families fight for control of the mythical land of Westeros.'
      }
    show = TelevisionShow.create(attrs)

    character = Character.new(
      role: 'Tyrion Lannister',
      actor: 'Peter Dinklage',
      television_show: show)

    visit television_show_path(show.id)
    fill_in 'Role', with: character.role
    fill_in 'Actor', with: character.actor
    click_on 'Submit'

    expect(page).to have_content 'Success'
    expect(page).to have_content character.role
    expect(page).to have_content character.actor
    expect(page).to have_content show.title

  end
end


