require 'Stomach'
require 'Observer'

class Human

	@stomach

	def initialize 
		@stomach = Stomach.new(4)
		@stomach.add_observer(self)
	end

	def eat(food)
		@stomach.add(food)
	end

	def update(warning)

		vomit if warning == "vomit"
		
		speak "Oooph. I'm getting full!" if warning == "getting_full"
		speak "I'm full!" if warning == "full"

		speak "#{@stomach.space} space remains in stomach."

	end

	def vomit
		speak "BLURRRRGH"
	end

	def speak(words)
		puts words
	end

end