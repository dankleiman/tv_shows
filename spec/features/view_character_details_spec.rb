require 'rails_helper'

feature 'user views character info on show page', %Q{
  As a site visitor
  I want to view the details for a TV show
  So I can learn more about it
} do



# Acceptance Criteria:
# * I can see a the show's title, network, the years it ran, and a synopsis
# * For each character, I can see the character's name, actor's name, and the character's description

  it 'adds a character' do
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

    expect(page).to have_content character.role
    expect(page).to have_content character.actor.name
    expect(page).to have_content character.description
    expect(page).to have_content show.title

  end
end


