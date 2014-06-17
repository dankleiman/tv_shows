require 'rails_helper'

feature 'user views a list of all characters', %Q{
    As a site visitor
    I want to view a list of people's favorite TV characters
    So I can find wonky characters to watch
  } do

# Acceptance Criteria:
# * I can see a list of all the characters
# * The character's name and the TV show it is associated with are listed
  it 'shows all characters' do

     attrs = {
          title: 'Game of Thrones',
          network: 'HBO',
          years: '2011-',
          synopsis: 'Seven noble families fight for control of the mythical land of Westeros.'
        }
      show = TelevisionShow.create(attrs)

      character = Character.create(
        role: 'Tyrion Lannister',
        actor: 'Peter Dinklage',
        television_show: show)

      visit characters_path

      expect(page).to have_content 'TV Characters'
      expect(page).to have_content character.role
      expect(page).to have_content show.title
  end


end
