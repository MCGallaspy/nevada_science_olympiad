require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "John Duck", email: "jduck@example.com",
                                        password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "      "
    assert_not @user.valid?
  end
  
  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end
  
  test "name should not be too long" do
    @user.name = "x"*51
    assert_not @user.valid?
  end
  
  test "email should not be too long" do
    @user.email = "y"*256
    assert_not @user.valid?
  end

  test "email validation should accept valid emails" do
    valid_addresses = %w[valid@example.com TOT-ally_valid@example.org.net john.duck@VALID.ORG john.is+duck@hell.edu]
    valid_addresses.each do |val_add|
      @user.email = val_add
      assert @user.valid?, "#{val_add.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email address should be unique" do
    user_dup = @user.dup
    user_dup.email = @user.email.upcase
    @user.save
    assert_not user_dup.valid?
  end

  test "password should have minimum length of 6" do
    @user.password = "a"*5
    @user.password_confirmation = "a"*5
    assert_not @user.valid?
  end
end
