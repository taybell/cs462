ruleset see_songs {

meta {
    name "See Songs"
    description <<
See Songs
>>
    author "Taylor Bell"
    logging on
    sharing on
    provides echo
 
  }
   
  rule songs is active {
    select when echo message input "(.*)" setting(m)
    send_directive("sing") with
      song = m;
  }
}