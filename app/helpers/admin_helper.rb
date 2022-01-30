module AdminHelper
  def admin_show_field(label, value)
    value_html = case value
                 when ActiveSupport::TimeWithZone, DateTime
                   "#{value.to_s} (#{time_ago_in_words(value)})"
                 when TrueClass
                   tag.span "true", class: "badge bg-success"
                 when FalseClass
                   tag.span "false", class: "badge bg-danger"
                 when String, NilClass
                   value.present? ? value : "&mdash;".html_safe
                 else
                   value.to_s
                 end

    label_ending = case value
                   when TrueClass, FalseClass
                     "? "
                   else
                     ": "
                   end

    tag.li(tag.strong(label + label_ending) + value_html, class: "list-group-item")
  end
end

