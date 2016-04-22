module ApplicationHelper

  def errors_for(model, attribute)
    if model.errors[attribute].present?
      content_tag :span, :class => 'error_explanation' do
        model.errors[attribute].join(", ")
      end
    end
  end

  def js_jquery_ready(script)
    content_for(:js_jquery_ready) {
      raw(script.gsub(/(<script>|<\/script>)/, ""))
    }
  end

  def js(script)
    content_for(:js) {
      raw(script.gsub(/(<script>|<\/script>)/, ""))
    }
  end

  def actions_to_index(object, options = {})

    show   = valid_boolean!(options[:show])
    edit   = valid_boolean!(options[:edit])
    delete = valid_boolean!(options[:delete])

    html = ""

    if show #&& can?(:read, object)
      html += link_to polymorphic_path(object) do
        raw("<i class='icon-eye-open'></i>")
      end
      html += raw("&nbsp;")
    end

    if edit #&& can?(:update, object)
      html +=  link_to edit_polymorphic_path(object) do
        raw("<i class='icon-pencil'></i>")
      end
      html += raw("&nbsp;")
    end

    if delete #&& can?(:destroy, object)
      html += link_to polymorphic_path(object), :method =>  :delete, :data => {  :confirm => t('.confirm', :default => t("helpers.links.confirm", :default => 'Deseja realmente remover este registro?'))}, :class => 'msgbox-confirm' do
          raw("<i class='icon-trash'></i>")
      end
      html += raw("&nbsp;")
    end
    raw(html)
  end

  def actions_to_view_show(object, options = {})
    edit   = valid_boolean!(options[:edit])
    delete = valid_boolean!(options[:delete])

    html = link_to 'Voltar', polymorphic_path(object.class), :class => 'btn'

    if edit #&& can?(:edit, object)
      html += raw('&nbsp;')
      html += link_to raw("<i class='icon-pencil'></i>"), edit_polymorphic_path(object), :class => 'btn'
    end

    if delete #&& can?(:delete, object)
      html += raw('&nbsp;')


      html += link_to raw("<i class='icon-trash'></i>"),  polymorphic_path(object),
                                                          :method => 'delete',
                                                          :data => { :confirm => t('.confirm', :default => t("helpers.links.confirm", :default => 'Deseja realmente remover este registro?')) },
                                                          :class => 'btn btn-danger'
    end

    raw(html)
  end

  def show_datetime(date)
    date.blank? ? 'Nunca' : l(date, :format => :datetime)
  end

  def valid_boolean!(value)
    !(defined?(value) && value.is_a?(FalseClass))
  end

  # format datetime to value attribute into html tag type="input"
  def format_datetime(f, attr_name)
    if f.object
      unless f.object.send(attr_name).blank?
        f.object.send(attr_name).strftime("%d/%m/%Y %H:%M")
      end
    end
  end

end
