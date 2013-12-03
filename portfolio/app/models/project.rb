class Project < ActiveRecord::Base
	validates :title, :description, presence:true

	def self.search_for(query)
		Project.where("title LIKE :query OR description LIKE :query OR category LIKE :query OR tag LIKE :query ORDER BY category ASC", :query => "%#{query}%")
	end

	def self.filter_for(cat)
		Project.where("category LIKE :cat AND featured = true ORDER BY category ASC", :cat => "%#{cat}%")
	end

	def self.get_filters
		projects = Project.all
		cats = []
		projects.each do |project|
			if !cats.include?(project.category)
				cats.push(project.category)
			end 
		end
		return cats
	end
end
