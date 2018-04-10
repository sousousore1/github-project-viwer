class ProjectsController < ApplicationController
  include GithubAccessible

  def index
    @projects = @github_client.projects(@current_repository.full_name)
  end

  def show
    @project = @github_client.project(params[:id])
    project_columns = @github_client.project_columns(params[:id])
    @columns = Parallel.map(project_columns, in_threads: project_columns.size) do |column|
      column_cards = @github_client.column_cards(column.id)
      cards = Parallel.map(column_cards, in_threads: column_cards.size) do |card|
        next unless card.content_url
        issue_number = card.content_url.split('/').last
        issue = @github_client.issue(@current_repository.full_name, issue_number)
        [card, issue]
      end.compact.to_h
      [column, cards]
    end.compact.to_h
  end
end
