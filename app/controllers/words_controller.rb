class WordsController < ApplicationController
  before_action :set_word, only: [:edit, :update, :destroy, :upvote, :downvote]

  # GET /words
  # GET /words.json
  def index
    @words = Word.all
  end

  # GET /words/1
  # GET /words/1.json
  def show
    @words = Word.where("name like ?", params[:id])

  end

  # GET /words/new
  def new
    @word = Word.new
    @creator = Creator.new
  end

  # POST /words
  # POST /words.json
  def create
    Rails.logger.debug "DEBUG: params are #{params}"
    Rails.logger.debug "DEBUG: creator params are #{params[:creator]}"
    Rails.logger.debug "DEBUG: word_params are #{word_params}"

    @creator = Creator.find_or_create_by_pseudonym(params[:creator][:pseudonym])


    @word = Word.new(word_params)
    @word.creator = @creator

    if @creator.email != params[:creator][:email]
       #don't allow saving and add error message so the user knows that the pseudonym already exists
    end

    respond_to do |format|
      if @word.save
        
        #send confirmation email to make the word active

        format.html { redirect_to @word, notice: 'Word was successfully created.' }
        format.json { render action: 'show', status: :created, location: @word }
      else
        format.html { render action: 'new' }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end

    
  end


  def upvote
    if @vote = @word.down_votes.voter(session[:voter_id]).first
      @vote.upvote = true
    else
      @vote = @word.up_vote session[:voter_id]
    end

    if @vote.save
      render nothing: true
    else
      render nothing: true
    end
  end

  def downvote
    if @vote = @word.up_votes.voter(session[:voter_id]).first
      @vote.upvote = false
    else
      @vote = @word.down_vote session[:voter_id]
    end
    if @vote.save
      render nothing: true
    else
      render nothing: true
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      key = params[:id] || params[:word_id]
      @word = Word.find key
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_params
      params[:word].permit(:name, :definition, :example, :creator => [:pseudonym, :creator])
    end
end
