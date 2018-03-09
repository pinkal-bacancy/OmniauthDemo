class User < ApplicationRecord
	has_many :authorizations
	validates :name, :email, :presence => true
	def add_provider(auth_hash)
		puts "--------------------------------------add_pr----------------"
  # Check if the provider already exists, so we don't add it twice
  	unless authorizations.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
    	Authorization.create :user => self, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
  	     puts "-----------------self-----------"
  	     puts self
  	end
	end
end
