module AdminHelper
  def admin_value_presenter(value)
    case value
    when ActiveSupport::TimeWithZone, DateTime
      "#{value.to_s} (#{time_ago_in_words(value)})"
    when TrueClass
      tag.span "Yes", class: "badge bg-success"
    when FalseClass
      tag.span "No", class: "badge bg-danger"
    when String, NilClass
      value.present? ? value : "&mdash;".html_safe
    else
      value.to_s
    end
  end

  def admin_show_field(label, value)
    value_html = admin_value_presenter(value)
    label_ending = case value
                   when TrueClass, FalseClass
                     "? "
                   else
                     ": "
                   end

    #tag.li(tag.strong(label + label_ending) + value_html, class: "list-group-item")
    tag.tr(tag.th(label + label_ending) + tag.td(value_html))
  end

  def admin_equal_or_value(value, original:)
    if value == original
      tag.span "Equal", class: "badge bg-light text-dark"
    else
      admin_value_presenter(value)
    end
  end
end

