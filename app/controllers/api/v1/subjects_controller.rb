class Api::V1::SubjectsController < ApplicationController

  def index
    subjects = Subject.all
    # render json: subjects
    render json: SubjectSerializer.new(subject)
  end

  def create
    subject = Subject.new(subject_params)

    if subject.save
      render json: subject, status: :accepted #allows us to send status codes with the fetch request
    else
      render json: {errors: subject.errors.full_messages}, status: :unprocessible_entitiy
    end
  end

  private

  def subject_params
    params.require(:subject).permit(:name)
  end
  # strong params. permitting only the attributes to be taken into the database to create a new instance.
  # because we have the top level has of :subject, we'll see that it's nested, so in the fetch request we have to send it back nested.


end
