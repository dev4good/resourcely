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
    items.push('<li id="' + key + '"><button style="width: 40%" class="btn">' + val + '</button></li>');
  });

  $('<ul/>', {
    'id': 'interaction',
    'style': 'list-style-type: none',
    html: items.join('')
  }).appendTo('#offerlist');
});
