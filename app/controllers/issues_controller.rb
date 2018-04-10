class IssuesController < ApplicationController
  include GithubAccessible

  def show
    @issue = @github_client.issue(@current_repository.full_name, params[:id])
    @comments = @github_client.issue_comments(@current_repository.full_name, params[:id])
  end
end
