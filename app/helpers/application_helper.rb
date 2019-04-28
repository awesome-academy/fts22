module ApplicationHelper
  def load_error_messages object
    object.errors.full_messages
  end

  def load_data_for_selectbox cols
    cols.map{|s| [s.name, s.id]}
  end
end
