class Review < ActiveRecord::Base
  belongs_to :pull_request

  def self.user_info
    result = {}
    group(:user, :state).count.each do |key, value|
      if result[key.first]
        result[key.first] = result[key.first].merge({key.last => value})
      else
        result[key.first] = {key.last => value}
      end
    end
    result
  end
end
