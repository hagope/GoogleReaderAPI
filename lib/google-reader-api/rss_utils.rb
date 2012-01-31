module GoogleReaderApi
  module RssUtils
    
    require "rss/parser"
    require "rss/atom"

    private

    def create_entries(atom_feed)
      begin
        # p RSS::Parser.parse(atom_feed.force_encoding('utf-8')).entries
        # RSS::Parser.parse(atom_feed.force_encoding('utf-8')).entries.map {|e| GoogleReaderApi::Entry.new(@api,e) }
        entries = RSS::Parser.parse(atom_feed.force_encoding('utf-8')).entries
        if entries.length > 0
          entries.map {|e| GoogleReaderApi::Entry.new(@api,e) }
        end
      rescue
        $stderr.print "Error parsing RSS"
      end
    end
    
  end
end