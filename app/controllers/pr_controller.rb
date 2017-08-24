class PrController < ApplicationController
  def create
    if event_header == 'pull_request'
      ProcessPullRequest.new(params).process
    elsif event_header == 'pull_request_review'
      ProcessPullRequestReview.new(params).process
    end
    render :ok
  end

  def open_prs
    render json: PullRequest.where("state != 'closed'").include(:reviews).to_json
  end

  def prs_with_reviews
    render json: PullRequest.prs_with_reviews.to_json
  end

  def user_info
    render json: Review.user_info.to_json
  end

  def index
    render json: PullRequest.all.include(:reviews).to_json
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
