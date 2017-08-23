class PullRequest < ActiveRecord::Base
  has_many :reviews
end
