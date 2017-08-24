class PullRequest < ActiveRecord::Base
  has_many :reviews
  default_scope {order(:number)}

  has_many :approved_reviews, -> {where(state: 'APPROVED')}, class_name: Review.to_s
  has_many :commented_reviews, -> {where(state: 'COMMENTED')}, class_name: Review.to_s
  has_many :changes_requested, -> {where(state: 'CHANGES_REQUESTED')}, class_name: Review.to_s


  def self.closed_prs
    where(state: 'closed').collect do |pr|
      {
        number: pr.number,
        created_at: pr.pr_created_at,
        closed_at: pr.pr_closed_at,
        diff: pr.pr_closed_at - pr.pr_created_at
      }
    end
  end

  def self.prs_with_reviews
    where(state: 'closed').collect do |pr|
      {
        number: pr.number,
        created_at: pr.pr_created_at,
        closed_at: pr.pr_closed_at,
        diff: pr.pr_closed_at - pr.pr_created_at,
        approved_reviews: pr.approved_reviews.size,
        commented_reviews: pr.commented_reviews.size,
        changes_requested: pr.changes_requested.size
      }
    end
  end

end
