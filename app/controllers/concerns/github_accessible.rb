module GithubAccessible
  extend ActiveSupport::Concern

  included do
    before_action :set_github_client
    before_action :set_repositories
    before_action :set_current_repository
  end

  private

  def set_github_client
    @github_client = Octokit::Client.new(access_token: ENV['GITHUB_ACCESS_TOKEN'])
  end

  def set_repositories
    @repositories = @github_client.repositories.select do |repository|
      return true if ENV['REPOSITORIES'].blank?
      ENV['REPOSITORIES'].split(',').include?(repository.name)
    end
  end

  def set_current_repository
    @current_repository = @repositories.find do |repository|
      repository.full_name == params[:repository_id]
    end || @repositories.first
  end
end