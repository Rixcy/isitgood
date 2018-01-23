function applySelect2() {
  $('select').select2();
}

$(function() {
  var year = moment().year();
  $('.copy-footer').append(year);

  applySelect2();

  $('.match-height').matchHeight();
});
