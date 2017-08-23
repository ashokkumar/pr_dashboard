class PrController < ApplicationController
  def create
    if header['X-GitHub-Event'] == 'pull_request'
      ProcessPullRequest.new(params).process
    end
  end

  def filter_params
    {
      number: params.number,
      pr_url: params.pull_request.html_url,
      pr_state: params.pull_request.state,
      pr_title: params.pull_request.title,
      user_name: params.user.login,
      created_at: params.created_at
    }
  end
end