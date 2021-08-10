class GistQuestionService

  def initialize(client: nil)
    @client = client || GitHubClient.new
  end

  def call(action: nil, question = Question.new)
    case action
    when :create
      create_gist(question)
    when :all
      all_gists
    end
  end

  def create_gist(question)
    @question = question
    @test = @question.test
    @client.create_gist(gist_params)
  end

  def all_gists
    @client.all_gists&.body
  end

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
