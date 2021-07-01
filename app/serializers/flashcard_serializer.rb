class FlashcardSerializer
  include FastJsonapi::ObjectSerializer
  attributes :term, :definition, :user_id, :subject_id, :user, :subject
end
