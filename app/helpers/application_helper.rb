module ApplicationHelper
  def load_error_messages object
    object.errors.full_messages
  end
end
