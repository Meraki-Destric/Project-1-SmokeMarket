class GamesController < ApplicationController
  before_action :set_game, only: %i[ show edit update destroy library ]
  # Only allows the user to see the index and show of the games model if they're not registered/logged-in
  before_action :authenticate_user!, except: %i[index show]

  # GET /games or /games.json
  def index
    @games = Game.all
  end

  # GET /games/1 or /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = current_user.games.build
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games or /games.json
  def create
    @game = current_user.games.build(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: "Game was successfully created." }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1 or /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: "Game was successfully updated." }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1 or /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: "Game was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # ADDS and REMOVES books to/from the library of the current user
  def library
    # Allows us to pass in any type of variable type without errors occuring
    type = params[:type]

    if type == "add"
      # Adds new game to the library
      current_user.library_additions << @game
      redirect_to library_index_path, notice: "#{@game.name} was added to your library"
    elsif type == "remove"
      # Removes game from library
      current_user.library_additions.delete(@game)
      redirect_to root_path, notice: "#{@game.name} was removed from your library"
    else
      # If type if missing, then just ignore it. Nothing happens
      redirect_to game_path(@game), notice: "Looks like nothing happened. Please try again"
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def game_params
    params.require(:game).permit(:logo, :name, :description, :rating, :user_id, :creator_id)
  end
end
