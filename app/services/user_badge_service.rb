class UserBadgeService

  def initialize(test_passage_id)
    @test_passage = TestPassage.find(test_passage_id)
    @user = @test_passage.user
    @test = @test_passage.test
  end

  def call
    Badge.all.each do |badge|
      @user.badges << badge if badge.send("#{badge.rule}_award?", badge_value )
    end
  end

  def badge_value
    {
      passed_from_first_attempt: passed_from_first_attempt?,
      all_backend_tests_completed: all_backend_tests_completed?
    }
  end

  def passed_from_first_attempt?
    @test_passage.test_attempts.count <= 1 && @test_passage.passed
  end

  def all_backend_tests_completed?
    @test.category.title == 'Backend' && @test.category.test.count == @test_passage.same_categories_tests_passed.count
  end


end
