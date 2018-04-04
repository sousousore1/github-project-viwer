module GithubAccessible
  extend ActiveSupport::Concern

  def github_client
    Octokit::Client.new(access_token: ENV['GITHUB_ACCESS_TOKEN'])
  end
end