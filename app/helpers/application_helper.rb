module ApplicationHelper
  def load_error_messages object
    object.errors.full_messages
  end

  def load_data_for_selectbox cols
    cols.map{|s| [s.name, s.id]}
  end

  def human_attribute_course_enum
    Course.statuses.map do |key, value|
      [t("activerecord.attributes.course.statuses.#{key}"), value]
    end
  end
end
