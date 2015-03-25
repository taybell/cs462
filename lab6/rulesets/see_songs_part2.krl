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
    send_directive("sing") with
      song = event:attr("input");
  }
}