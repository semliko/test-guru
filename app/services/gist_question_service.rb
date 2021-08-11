class GistQuestionService
  attr_reader :response

  def initialize(client: nil)
    @client = client || GitHubClient.new
  end

  def create_gist(question)
    @question = question
    @test = @question.test
    @response = @client.create_gist(gist_params)
    JSON.parse(@response.body)
  end

  def response_body
    JSON.parse(@response.body)
  end

  #  def all_gists
  #    @client.all_gists&.body
  #  end

  private

  def gist_params
    {
      description: "A question aboutn #{@test.title} from TestGuru" ,
      files: {
        'test-guru-question.txt' => { content: gist_content }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
