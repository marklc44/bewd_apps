class Story < ActiveRecord::Base
	validates :title, :category, :link, presence:true
	validates :upvotes, numericality: { only_integer: true, greater_than_or_equal_to: 0 } 

	def self.search_for	(query)
		Story.where("title LIKE :query OR category LIKE :query", :query => "%#{query}%")
	end
end
