class Gist


  class << self
    def all
      GistQuestionService.call(:all)
    end

    def create(question)
      GistQuestionService.call(question)
    end
  end
end
