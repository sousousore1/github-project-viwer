module ProjectsHelper
  def state2icon(state)
    case state
      when 'open'
        content_tag('i', nil, class: 'fa fa-check-circle text-success')
      when 'closed'
        content_tag('i', nil, class: 'fa fa-check-circle text-danger')
    end
  end

  def badge_to(issue)
    if issue.pull_request
      content_tag('span', 'pull request', class: 'badge badge-primary')
    else
      content_tag('span', 'issue', class: 'badge badge-secondary')
    end
  end
end
