var Foo = {
  first: function(){
    alert('Hi for verbs')
  },
  second: function() {
    this.first()
  }
}
bar = Foo;
$(function() {
  if (NewVerb) { NewVerb() }
})

