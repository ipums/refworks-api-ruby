class FoldersResponse < Response

  attr_reader :total, :folders

  def initialize(raw_response)
    super(raw_response)
    if result_code != "200"
      @total = "0"
      return
    end

    # If results returned, process the folders and metadata

    @total = self.parsed_response["refworks"]["RWResult"]["RWFolders"]["total"]

    folder_list = self.parsed_response["refworks"]["RWResult"]["RWFolders"]["Folders"]

    # here we parse out folders into an array of actual Author objects (even if only 1 ref returned)
    @folders = Array.new

    # The RefWorks API can return an array or a single element depending on how many folders were returned.
    if folder_list.class == Array
      folder_list.each do |rawfolder|
        @folders << Folder.new(rawfolder)
      end
    else
      # here, "folder_list" is just a hash representing a single folder
      # in other words, only one folder was returned
      @folders << Folder.new(folder_list)
    end
  end
end