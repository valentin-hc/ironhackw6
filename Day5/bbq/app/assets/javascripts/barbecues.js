// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

(function main () {
  var isJoining = false

  $('[data-hook~=join-bbq]').on('click', function (event) {
    if (isJoining) {
      return
    }

    isJoining = true
    var $button = $(event.target)
    var bbqId = $button.closest('[data-bbq]').data('bbq')

    var request = $.post('/api/barbecues/' + bbqId + '/join')

    request.fail(function () {
      alert('Couldn’t join the barbecue. Try again later.')
      isJoining = false
    })

    request.done(function (data) {
      $button.text(data.success)
      isJoining = false
    })
  })

  if ($('[data-hook~=controller-barbecues][data-hook~=action-show]').length) {
    var $bbqContainer = $('[data-hook=bbq-info]')
    var bbqId = $bbqContainer.data('bbq')
    var request = $.get('/api/barbecues/' + bbqId)

    request.fail(function () {
      var htmlParts = [
        '<div class="alert alert-danger" role="alert">',
        '  There was a problem retrieving the BBQ info. Try again later.',
        '</div>'
      ]
      $bbqContainer.append(htmlParts.join('\n'))
    })

    request.done(function (data) {
      var bbqMoment = moment(data.bbq.date)
      console.log(data.users);
      var htmlParts = [
        '<h2>' + data.bbq.title + '</h2>',
        '<dl>',
        '  <dt>Date:</dt>',
        '  <dd>' + bbqMoment.format('MMMM, D YYYY [at] h:mm a') + '</dd>',
        '  <dt>Venue:</dt>',
        '  <dd>' + data.bbq.venue + '</dd>',
        '  <dt>People going:</dt>',
        '</dl>'
      ]
      $bbqContainer.append(htmlParts.join('\n'))
      data.users.forEach(function (user) {
        $('[data-hook=bbq-info]').append('<li>' + user.name + '</li>');
      });
      $bbqContainer.append('<h4> BBQ Items </h4>');
      data.items.forEach(function (item) {
        $('[data-hook=bbq-info]').append('<li>' + item.name + ', quantity: ' + item.quantity + '</li>');
      });
    })
  }
})()
