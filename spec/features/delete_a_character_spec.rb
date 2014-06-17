require 'rails_helper'

feature 'user can delete a character', %Q{
  As a site visitor
  I want to delete a character I don't like
  So no one else will want to watch that character
} do



# Acceptance Criteria:
# * I can delete a character from the database
# * If the record is not successfully deleted, I receive an error message

  it 'deletes a character' do
    attrs = {
        title: 'Game of Thrones',
        network: 'HBO',
        years: '2011-',
        synopsis: 'Seven noble families fight for control of the mythical land of Westeros.'
      }
    show = TelevisionShow.create(attrs)

    actor = Actor.create(name: 'Peter Dinklage')

    character = Character.create(
      role: 'Tyrion Lannister',
      actor: actor,
      description: "Tyrion is the third and youngest son of Lord Tywin and Lady Joanna Lannister. He is a dwarf. Because of his unusual stature Tyrion has been a victim of mockery his entire life, with people overlooking his noble birth in order to tease and taunt him. He has also suffered physical indignities in a world not built for someone his size.",
      television_show: show)


    visit television_show_path(show.id)
    click_on('Delete')

    expect(page).not_to have_content character.role
    expect(page).not_to have_content character.actor
    expect(page).not_to have_content character.description

  end
end


