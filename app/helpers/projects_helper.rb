module ProjectsHelper
  def state2icon(state)
    case state
      when 'open'
        content_tag('i', nil, class: 'fa fa-check-circle text-success')
      when 'closed'
        content_tag('i', nil, class: 'fa fa-check-circle text-danger')
    end
  end

  def repository_name
    params[:repository_id] || @repositories.first.full_name
  end
end
