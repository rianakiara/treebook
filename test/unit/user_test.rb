require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "a user shoul enter a first name" do 
		user = User.new
		assert !user.save
		assert !user.errors[:first_name].empty?
	end

	test "a user shoul enter a last name" do 
		user = User.new
		assert !user.save
		assert !user.errors[:last_name].empty?
	end

	test "a user shoul enter a profile name" do 
		user = User.new
		assert !user.save
		assert !user.errors[:profile_name].empty?
	end

	test "a user shoul have a unique profile name" do 
		user = User.new
		user.profile_name = users(:yudi).profile_name
		user.email = 'ricardo.ianakiara@gmail.com'
		user.first_name = 'Ricardo'
		user.last_name = 'ianakiara'
		user.password = "k2v8ptj21"
		user.password_confirmation = "k2v8ptj21"

		assert !user.save
		assert !user.errors[:profile_name].empty?
	end
end
 