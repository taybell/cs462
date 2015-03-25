ruleset see_songs_part2 {

meta {
    name "See Songs Part2"
    description <<
See Songs Part2
>>
    author "Taylor Bell"
    logging on
    sharing on
    provides echo
 
  }
   
  rule songs is active {
    select when echo message msg_type "(song)"
    pre {

    }
    {
      send_directive("sing") with
        song = event:attr("input");
    }
    always {
      raise explicit event "sung" 
       with song = event:attr("song");
    }

  }

  rule find_hymn is active {
    select when explicit sung song "(.*god.*)" setting(m)
    pre {

    }
    {
      noop();
    }
    always {
      raise explicit event "found_hymn"
        with song = event:attr("song")
    }
  }
}