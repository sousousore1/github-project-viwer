source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.2.0'
gem 'puma'
gem 'sass-rails'
gem 'uglifier'
gem 'jbuilder'
gem 'octokit'
gem 'bootstrap'
gem 'jquery-rails'
gem 'font-awesome-rails'
gem 'zurui-sass-rails'
gem 'autoprefixer-rails'
gem 'settingslogic'
gem 'parallel'
gem 'redcarpet'
gem 'bootsnap'

group :development, :test do
  gem 'sqlite3'
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-byebug'
  gem 'pry-stack_explorer'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'dotenv-rails'
end

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
end

group :production do
  gem 'pg'
end
