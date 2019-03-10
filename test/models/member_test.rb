require 'test_helper'

class MemberTest < ActiveSupport::TestCase

  def setup
    @older_member = Member.new(email: "mem@example.com", password: 'password')
    @new_member = Member.new(email: "user@example.com", password: 'password')
  end

  test "should be valid" do
    assert @new_member.valid? 
  end

  test "email should be unique" do
    @new_member.email = @older_member.email
    @older_member.save!
    assert_not @new_member.valid?
  end

  test "email should be presence" do
    @new_member.email = nil
    assert_not @new_member.valid?
  end

  test "password should be at least 8 char" do
    @new_member.password = 'pass'
    assert_not @new_member.valid?
  end

  test "password should be presence" do
    @new_member.password = nil
    assert_not @new_member.valid?
  end

  test "username should be at less than 5 char if is email prefix" do
    @older_member.save!
    @older_member.username = 'mem'
    assert @older_member.valid?
  end

  test "username should be at least 5 char when update members" do
    @older_member.save!
    @older_member.username = 'w'
    assert_not @older_member.valid?
  end

end
