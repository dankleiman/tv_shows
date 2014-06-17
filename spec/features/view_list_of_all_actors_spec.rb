require 'rails_helper'

feature 'user views a list of all actors', %Q{
    As a site visitor
    I want to view a list of all TV actors
  } do

# Acceptance Criteria:
# * I can see a list of all the actors
# * The actors' roles and the TV shows they are associated with are listed

  it 'shows all actors' do

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
        television_show: show)

      visit actors_path

      expect(page).to have_content 'Actors'
      expect(page).to have_content actor.name
  end


end
