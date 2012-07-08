$('#interaction a').click(function (e) {
    e.preventDefault();
    $(this).tab('show');
    })

$(function () {
$('#interaction a:last').tab('show');
})

$.getJSON('teststream.json', function(data) {
  var items = [];

  $.each(data, function(key, val) {
    items.push('<li id="' + key + '">' + val + '</li>');
  });

  $('<ul/>', {
    'id': 'interaction',
    html: items.join('')
  }).appendTo('#want');
});
