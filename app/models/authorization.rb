class Authorization < ApplicationRecord
	belongs_to :user
	validates :provider, :uid, :presence => true
	def self.find_or_create(auth_hash)
  	unless auth = find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
    	user = User.create :name => auth_hash["user_info"]["name"], :email => auth_hash["user_info"]["email"]
    	  	    puts "-------------------------------------------------------------"

    	puts user.name
    	auth = create :user => user, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
  	    puts "-------------------------------------------------------------"
  	    puts auth.name 
  	end
  	auth
	end
end
