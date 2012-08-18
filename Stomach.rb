#require 'StomachFullException'
require 'Observer'

class Stomach
	include Observable

	attr_accessor :capacity, :contents, :space

	def initialize (capacity)
		@contents = 0
		@space = capacity
		@capacity = capacity 
	end

	def add (food)
	
		if @contents + food > @capacity
			expel 
			return
		end

		@contents += food
		@space = @capacity - @contents

		warning = "getting_full" if @space < 2 unless space == 0
		warning = "full" if @space == 0

		changed
		notify_observers warning

	end

	def expel

		@contents = 0
		@space = @capacity
		changed		
		notify_observers("vomit") 

	end

end