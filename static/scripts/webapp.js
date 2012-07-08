$('#interaction a').click(function (e) {
    e.preventDefault();
    $(this).tab('show');
    })

$(function () {
$('#interaction a:last').tab('show');
})

$.getJSON('teststream.json',function(data) {
  var itemsWant = [];

  $.each(data, function(key, val) {
    itemsWant.push('<li id="' + [key].name + '"><button style="width: 40%" class="btn">' + [val].name + '</button></li>');
  });

  $('<ul/>', {
    'id': 'interaction',
    'style': 'list-style-type: none',
    html: itemsWant.join('')
  }).appendTo('#want');
});


$.getJSON('teststream.json', function(data) {
  var itemsHave = [];

  $.each(data, function(key, val) {
    itemsHave.push('<li id="' + key + '"><button style="width: 40%" class="btn">' + val + '</button></li>');
  });

  $('<ul/>', {
    'id': 'interaction',
    'style': 'list-style-type: none',
    html: itemsHave.join('')
  }).appendTo('#have');
});

