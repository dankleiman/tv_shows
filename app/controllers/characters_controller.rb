class CharactersController < ApplicationController

  def index
    @characters = Character.all
  end

  def destroy
    character = Character.find(params[:id])
    show = character.television_show_id
    if character.destroy
      flash[:notice] = "Successfully deleted."
    else
      flash[:notice] = "Unable to delete."
    end
    redirect_to television_show_path(show)
  end

  def create
    @television_show = TelevisionShow.find(params[:television_show_id])
    @character = Character.new(character_params)
    @actor = Actor.find_or_create_by(name: params[:character][:actor])
    @character.actor = @actor
    @character.television_show = @television_show

    if @character.save
      flash[:notice] = "Success!"
    else
      flash[:notice] = "Could not save this character."
    end
    redirect_to "/television_shows/#{@television_show.id}"
  end

  private

  def character_params
    params.require(:character).permit(:role, :show)
  end

end
