ruleset echo_server {

meta {
    name "Echo Server"
    description <<
hello world echo
>>
    author "Taylor Bell"
    logging on
    sharing on
    provides echo
 
  }

  rule hello_world is active {
    select when echo hello
    send_directive("say") with
      something = "Hello World";
  }
   
  rule echo is active {
    select when echo message input "(.*)" setting(m)
    send_directive("say") with
      something = m;
  }
}