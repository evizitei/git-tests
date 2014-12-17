require 'minitest/autorun'
require_relative 'git_changes'

class GitChangesTest < MiniTest::Unit::TestCase
  def test_commit_with_tests
    files = %Q{app/models/user.rb\nspec/models/user_spec.rb}
    assert_equal false, GitChanges.is_a_problem?(files)
  end

  def test_commit_without_tests
    files = %Q{app/models/user.rb}
    assert_equal true, GitChanges.is_a_problem?(files)
  end

  def test_checking_feature_flags
    files = %Q{lib/feature.rb}
    assert_equal false, GitChanges.is_a_problem?(files)
  end
end
