ruleset song_store {

meta {
    name "Song Store"
    description <<
Song Store
>>
    author "Taylor Bell"
    logging on
    sharing on
    provides songs, hymns, secular_music
 
  }
  global {
    songs = function() {
      s = ent:songs;
      s;
    };
    hymns = function() {
      h = ent:hymns;     
      h;
    };
    secular_music = function() {
      diff = songs.values().difference(hymns.values());
      diff;
    };
   
  }
   
  rule collect_songs is active {
    select when explicit sung 
      pre {
        s = {time:now() : event:attr("song")};
        songs = s.put(ent:songs);
      }
      {
        noop();
      }
      always {
        set ent:songs songs;
      }
  }

  rule collect_hymns is active {
    select when explicit found_hymn
      pre {
        h = {time:now() : event:attr("hymn")};
        hymns = s.put(ent:hymns);
      }
      {
        noop();
      }
      always {
        set ent:hymns hymns;
      }

  }

  rule clear_songs is active {
    select when song reset
      pre{

      }
      {
        noop();
      }
      always{
        clear ent:songs;
        clear ent:hymns;
      }
  }

  rule list_songs is active {
    select when list songs
    send_directive("songies") with
      something = ent:songs;
  }
}