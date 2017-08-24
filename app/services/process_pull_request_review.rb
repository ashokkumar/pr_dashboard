class ProcessPullRequestReview
  attr_reader :data, :pr

  def initialize(data, pr)
    @data = data
    @pr = pr
  end

  def process
    pull_request = PullRequest.find_by_number(pr.number)
    review = Review.create(filtered_data.merge(pull_request: pull_request))
  end

  private
  def pr_number
    data['pull_request']['number']
  end

  def filtered_data
    {
      state: data['state'],
      body: data['body'],
      submitted_at: data['submitted_at'],
      user: data['user']['login']
    }
  end
end
