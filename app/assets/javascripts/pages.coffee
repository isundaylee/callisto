ready = ->
  if $('body#pages_dashboard').length > 0
    App.reveal_robot = ->
      id = parseInt($(this).data('robot-id'))
      App.current_active_robot_id = id
      $('.robot, .robot-detail').removeClass('active')
      $('[data-robot-id=' + id + ']').addClass('active')

    App.challenge_robot = ->
      challengee_id = parseInt($(this).data('robot-id'))
      challenger_id = App.current_active_robot_id
      $('#fight_challengee_id').val(challengee_id)
      $('#fight_challenger_id').val(challenger_id)
      $('#new_fight').submit()

    $('.robot').click App.reveal_robot
    $('.robot')[0].click()

    $('.challenge-button').click App.challenge_robot

$(document).ready(ready)
$(document).on('page:load', ready)