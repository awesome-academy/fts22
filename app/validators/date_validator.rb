class DateValidator < ActiveModel::EachValidator
  def validate_each record, attribute, value
    return if value.blank?
    criteria = options.keys.first
    comparation_field = parse_date record, options
    return unless comparation_field[:value]
    case criteria
    when :after
      handle_after value, record, attribute, comparation_field
    when :after_or_equal_to
      after_or_equal_to value, record, attribute, comparation_field
    end
  end

  def handle_after value, record, attribute, comparation_field
    return if value > comparation_field[:value]
    record.errors.add attribute, I18n.t("date_validator.date_after_error"),
      date: comparation_field[:field_name]
  end

  def after_or_equal_to value, record, attribute, comparation_field
    return if value >= comparation_field[:value]
    record.errors.add attribute,
      I18n.t("date_validator.date_after_equal_error"),
      date: comparation_field[:field_name]
  end

  protected

  def parse_date record, options
    comparation_field = options.values.first
    begin
      {
        value: comparation_field.to_datetime,
        field_name: comparation_field
      }
    rescue NoMethodError, ArgumentError
      {
        value: record.try(comparation_field),
        field_name: record.class.human_attribute_name(comparation_field)
      }
    end
  end
end
