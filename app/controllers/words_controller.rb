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
    @words = Word.where name: params[:id]
  end

  # GET /words/new
  def new
    @word = Word.new
  end

  # GET /words/1/edit
  def edit
  end

  # POST /words
  # POST /words.json
  def create
    @word = Word.new(word_params)

    respond_to do |format|
      if @word.save
        format.html { redirect_to @word, notice: 'Word was successfully created.' }
        format.json { render action: 'show', status: :created, location: @word }
      else
        format.html { render action: 'new' }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /words/1
  # PATCH/PUT /words/1.json
  def update
    respond_to do |format|
      if @word.update(word_params)
        format.html { redirect_to @word, notice: 'Word was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /words/1
  # DELETE /words/1.json
  def destroy
    @word.destroy
    respond_to do |format|
      format.html { redirect_to words_url }
      format.json { head :no_content }
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
      params[:word].permit(:name, :definition, :pseudonym, :email, :example)
    end
end
