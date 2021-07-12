module TestPassagesHelper
  def result_outcome(test_passage)
    if test_passage.success?
      { message: 'Test passed successfully', status: 'test_passed' }
    else
      { message: 'Test failed', status: 'test_failed' }
    end
  end
end
