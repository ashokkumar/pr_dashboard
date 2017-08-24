desc 'Extra PRs from given repo.'
task :pull_prs, [:repo] => :environment do |t, args|
  @repo = args[:repo]
  process_prs(prs(args[:repo], 'open'))
  process_prs(prs(args[:repo], 'closed'))
end

def client
  Octokit::Client.new(access_token: 'a90efdc97a6d9210f973791031c0de45ab5f9508')
end

def process_prs(pull_requests)
  p pull_requests.count
  pull_requests.each do |pr|
    ProcessPullRequest.new(pr).process
    process_pr_review(pr).each do |review|
      p pr.number
      ProcessPullRequestReview.new(review, pr).process
    end
  end
end

def process_pr_review(pr)
  p pr.number
  p @repo
  client.pull_request_reviews(@repo, pr.number)
end

def prs(repo, status)
  client.pull_requests(repo, {state: status, per_page: 100})
end
