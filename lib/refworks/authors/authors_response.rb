class AuthorsResponse < Response

  attr_reader :total, :authors

  def initialize(raw_response)
    super(raw_response)
    if result_code != "200"
      @total = "0"
      return
    end

    # If results returned, process the authors and metadata

    @total = self.parsed_response["refworks"]["RWResult"]["RWAuthor"]["total"]

    author_list = self.parsed_response["refworks"]["RWResult"]["RWAuthor"]["Author"]

    # here we parse out authors into an array of actual Author objects (even if only 1 ref returned)
    @authors = Array.new

    # The RefWorks API can return an array or a single element depending on how many authors were returned.
    if author_list.class == Array
      author_list.each do |rawauthor|
        @authors << Author.new(rawauthor)
      end
    else
      # here, "author_list" is just a hash representing a single author
      # in other words, only one author was returned
      @authors << Author.new(author_list)
    end
  end
end