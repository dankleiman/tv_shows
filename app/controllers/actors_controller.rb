class ActorsController < ApplicationController

  def index
    @actors = Actor.all
  end

  def create
    @actor = Actor.new(actor_params)
    if @actor.save
      flash[:notice] = "Success!"
    else
      flash[:notice] = "Could not save this actor."
    end
    redirect_to actor_path(@actor.id)
  end

  private

  def actor_params
    params.require(:actor).permit(:name)

  end

end
