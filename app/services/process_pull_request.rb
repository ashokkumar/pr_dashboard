class ProcessPullRequest
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def process
    pr = PullRequest.find_or_create_by(number: filtered_data.number)
    pr.update_attributes(filtered_data)
  end

  private
  def filtered_data
    {
      number: data.number,
      html_url: data.pull_request.html_url,
      state: data.pull_request.state,
      title: data.pull_request.title,
      pr_created_at: data.pull_request.created_at,
      pr_closed_at: data.pull_request.closed_at,
      pr_merged_at: data.pull_request.pr_merged_at
    }
  end
end
