
rule hello_world is active {
	meta {
    name "Hello World Echo"
    description <<
hello world echo
>>
    author "Taylor Bell"
    logging on
    sharing on
    provides hello echo
 
  }

  select when echo hello
  send_directive("say") with
    something = "Hello World";
}
   
rule echo is active {
	meta {
    name "Hello World Echo"
    description <<
	echo
>>
    author "Taylor Bell"
    logging on
    sharing on
    provides echo
 
  }

  select when echo message input "(.*)" setting(m)
  send_directive("say") with
    something = m;
}