class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :restrict_remote_ip
  before_action :authenticate_basic
  before_action :set_repositories

  private

  def restrict_remote_ip
    if ENV['PERMIT_ADDRESS_PATTERNS'].present?
      matched = ENV['PERMIT_ADDRESS_PATTERNS'].split(',').any? do |permit_address_pattern|
        request.remote_ip.match permit_address_pattern
      end
      render plain: 'Service Unavailable', status: 503 unless matched
    end
  end

  def authenticate_basic
    if ENV['BASIC_USER'] && ENV['BASIC_PASS']
      authenticate_or_request_with_http_basic do |user, pass|
        user == ENV['BASIC_USER'] && pass == ENV['BASIC_PASS']
      end
    end
  end

  def set_repositories
    @repositories = github_client.repositories.select do |repository|
      if ENV['REPOSITORIES'].present?
        ENV['REPOSITORIES'].split(',').include?(repository.name)
      else
        true
      end
    end
  end
end
