require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "a user should enter a first name" do 
		user = User.new
		assert !user.save
		assert !user.errors[:first_name].empty?
	end

	test "a user should enter a last name" do 
		user = User.new
		assert !user.save
		assert !user.errors[:last_name].empty?
	end

	test "a user should enter a profile name" do 
		user = User.new
		assert !user.save
		assert !user.errors[:profile_name].empty?
	end

	test "a user should have a unique profile name" do 
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

	test "a user should have a profile name without spaces" do
		user = User.new(
					first_name: "Ricardo",
					last_name:  "Ianakiara",
					email: "ricardo.ianakiara@gmail.com" 
				)
		user.password = user.password_confirmation = "k2v8ptj21"

		user.profile_name = "my profile name with spaces"

		assert !user.save
		assert !user.errors[:profile_name].empty?
		assert user.errors[:profile_name].incluide?("Must be formatted correctly.")
	end

	test "a user can have a correctly profile name" do
		user = User.new(
					first_name: "Ricardo",
					last_name:  "Ianakiara",
					email: "ricardo.ianakiara@gmail.com" 
				)
		user.password = user.password_confirmation = "k2v8ptj21"
		user.profile_name = "yudi"

		assert user.valid?
	end
end
 