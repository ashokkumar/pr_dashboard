class ProcessPullRequestReview
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def process
    pr = PullRequest.find_by_number(pr_number)
    review = Review.create(filtered_data.merge(pull_request: pr))
  end

  private
  def pr_number
    data['pull_request']['number']
  end

  def filtered_data
    review = data['review']
    {
      state: review['state'],
      body: review['body'],
      submitted_at: review['submitted_at'],
      user: review['user']['login']
    }
  end

  def pr
    data['pull_request']
  end
end
