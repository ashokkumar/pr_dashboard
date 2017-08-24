class ProcessPullRequest
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def process
    return unless filtered_data
    p "Processing PR #{filtered_data[:number]}"
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
      html_url: data['html_url'],
      state: data['state'],
      title: data['title'],
      pr_created_at: data['created_at'],
      pr_closed_at: data['closed_at'],
      pr_merged_at: data['pr_merged_at']
    }
  end

  def pr
    data['pull_request']
  end
end
