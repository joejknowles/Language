function NewVerb() {
  var persons = ['first', 'second', 'third'];
  var pluralities = ['singular', 'plural'];
  var englishFields = [];
  pluralities.forEach(function(plurality) {
    persons.forEach(function(person) {
      var fieldString = `.English.${person}person${plurality}`
      englishFields.push($(fieldString));
    });
  });
  $('.English.infinitive').keyup(function() {
    var infinitiveText = $(this).val();

    for(i = 0; i < 6; i++) {
      $(englishFields[i]).val(infinitiveText);
    }
    var secondP = $(englishFields[1])
    secondP.val(secondP.val() + "s")
  });
}
