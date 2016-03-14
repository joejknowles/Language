function NewVerb() {
  conjugateEnglish();
  conjugateCzech();
}

getFieldsForLanguage = function(language){
  var persons = ['first', 'second', 'third'];
  var pluralities = ['singular', 'plural'];
  var englishFields = [];
  pluralities.forEach(function(plurality) {
    persons.forEach(function(person) {
      var fieldString = `.${language}.${person}person${plurality}`
      englishFields.push($(fieldString));
    });
  });
  return englishFields;
};

conjugateEnglish = function(){
  var englishFields = getFieldsForLanguage('English');
  $('.English.infinitive').keyup(function() {
    var infinitiveText = $(this).val();

    for(i = 0; i < 6; i++) {
      $(englishFields[i]).val(infinitiveText);
    }
    var secondP = $(englishFields[2])
    secondP.val(secondP.val() + "s")
  });
};

conjugateCzech = function(){
  var englishFields = getFieldsForLanguage('Czech');
  $('.Czech.infinitive').keyup(function() {
    var infinitiveText = getCzechRoot($(this).val());
    for(i = 0; i < 6; i++) {
      $(englishFields[i]).val(infinitiveText + czechEndings[i]);
    }
  });
};

getCzechRoot = function(word) {
  return word.slice(0, -2)
}

czechEndings = [
  'ím',
  'íš',
  'í',
  'íme',
  'íte',
  'í'
]