class ManuscriptFolderResponse < ManuscriptResponse
  attr_reader :filetoken

  def initialize(raw_response)
    super(raw_response)

    if result_code != "200"
      return
    end

    @filetoken = self.parsed_response["refworks"]["RWResult"]["RWManuscript"]["FileToken"]
  end

end