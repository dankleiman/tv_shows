class CharactersController < ApplicationController

  def index
    @characters = Character.all
  end

  def create
    @television_show = TelevisionShow.find(params[:television_show_id])
    @character = Character.new(character_params)
    @character.television_show = @television_show
    if @character.save
      flash[:notice] = "Success!"
      redirect_to "/television_shows/#{@television_show.id}"
    else
      flash[:notice] = "Could not save this character."
      redirect_to "/television_shows/#{@television_show.id}"
    end
  end

  private

  def character_params
    params.require(:character).permit(:role, :actor, :show)
  end

end
