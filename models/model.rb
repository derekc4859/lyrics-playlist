require 'lyricfy'
require 'rspotify'

RSpotify.authenticate("client-id", "client-secret")

class Song
    attr_reader :name, :artist, :album_img, :lyrics
    
    def initialize(name,artist,album_img)
        @name = name
        @artist = artist
        @album_img = album_img
    end
    
    def get_lyrics
        begin
            fetcher = Lyricfy::Fetcher.new
            lyrics = fetcher.search(@artist,@name)
            @lyrics = lyrics.body.split('\n') # returns an array of lyrics    
        rescue
            @lyrics = ["Sorry, no lyrics found."]
        end
    end
    
end

class Playlist
    attr_reader :user, :playlist_id, :name, :songs
    
    def initialize(user,playlist_id)
        @user = user
        @playlist_id = playlist_id
        @songs = [] # an array to hold all of the Song instances
    end
    
    def get_info
        playlist = RSpotify::Playlist.find(@user,@playlist_id)
        
        # get playlist name
        
    
        # fill the @songs array with new instances of the Song class
        
    end
    
    def get_lyrics
        @songs.each do |song|
            song.get_lyrics
        end
    end
    
end

# use this to test out the API
spotify_top_tracks_playlist = RSpotify::Playlist.find("spotify","5FJXhjdILmRA2z5bvz4nzf")
puts spotify_top_tracks_playlist

# use this to test out the classes
# spotify_top_tracks = Playlist.new("spotify","5FJXhjdILmRA2z5bvz4nzf")