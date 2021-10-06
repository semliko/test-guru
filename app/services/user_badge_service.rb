class UserBadgeService

  def initialize(test_passage_id)
    @test_passage = TestPassage.find(test_passage_id)
    @user = @test_passage.user
    @test = @test_passage.test
  end

  def call
    add_badge_to_user
  end

  def add_badge_to_user
    new_badges_ids = calculate_badges.map{ |b| b.id }
    @user.badges << Badge.where(id: new_badges_ids)
  end

  def calculate_badges
    Badge.select{|badge| can_be_added_to_user?(badge)}
  end

  def can_be_added_to_user? (badge)
    [
      passed_from_first_attempt? && badge.name == "Test passed from the first attempt",
      all_backend_tests_completed? && badge.name == "All Backend tests compleated"
    ].include?(true)
  end

  def passed_from_first_attempt?
    @test_passage.test_attempts.count <= 1 && @test_passage.success?
  end

  def all_backend_tests_completed?
    @test.category.title == 'Backend' && @test.category.test.count == @test_passage.same_categories_tests_passed.count
  end
end
