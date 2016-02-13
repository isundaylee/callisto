ready = ->
  if $('body#pages_dashboard').length > 0
    App.reveal_robot = ->
      id = parseInt($(this).data('robot_id'))
      $('.robot, .robot-detail').removeClass('active')
      $('[data-robot_id=' + id + ']').addClass('active')

    $('.robot').click App.reveal_robot

$(document).ready(ready)
$(document).on('page:load', ready)