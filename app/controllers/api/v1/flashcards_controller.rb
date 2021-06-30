class Api::V1::FlashcardsController < ApplicationController

  def index
    flashcard = Flashcard.all
    # render json: flashcard
    render json: FlashcardSerializer.new(flashcard)
  end

  def create
    subject = Flashcard.new(flashcard_params)

    if flashcard.save
      render json: flashcard, status: :accepted #allows us to send status codes with the fetch request
    else
      render json: {errors: flashcard.errors.full_messages}, status: :unprocessible_entitiy
    end
  end

  private

  def flashcard_params
    params.require(:flashcard).permit(:term, :definition, :user_id, :subject_id)
  end

end
