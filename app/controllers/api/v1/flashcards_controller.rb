class Api::V1::FlashcardsController < ApplicationController

  def index
    @flashcards = Flashcard.all
    # render json: flashcard
    render json: FlashcardSerializer.new(@flashcards)
  end

  def create
    @flashcard = Flashcard.new(flashcard_params)
    # byebug
    if @flashcard.save
      render json: @flashcard, status: :accepted
    else
      render json: { errors: @flashcard.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def flashcard_params
    params.require(:flashcard).permit(:term, :definition, :subject_id, :user_id)
  end

end
