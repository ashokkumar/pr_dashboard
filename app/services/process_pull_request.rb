class ProcessPullRequest
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def process
    pr = PullRequest.find_by_number(filtered_data[:number])
    if pr
      pr.update_attributes(filtered_data)
    else
      PullRequest.create(filtered_data)
    end
  end

  private
  def filtered_data
    {
      number: data['number'],
      html_url: pr['html_url'],
      state: pr['state'],
      title: pr['title'],
      pr_created_at: pr['created_at'],
      pr_closed_at: pr['closed_at'],
      pr_merged_at: pr['pr_merged_at']
    }
  end

  def pr
    data['pull_request']
  end
end
