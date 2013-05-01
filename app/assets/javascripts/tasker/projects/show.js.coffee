Tasker.Projects = {} if Tasker.Projects is undefined

Tasker.Projects.Show = ->
  $('.new-task-button').click ->
    url = $(this).data('url')
    $.ajax
      url: url
      type: "GET"
      success: (data)->
        $('#newTask .modal-body').html(data)
      error: ->
        $('#newTask .modal-body').html("ERROR")

  $('.edit-project-button').click ->
    url = $(this).data('url')
    $.ajax
      url: url
      type: "GET"
      success: (data)->
        $('#editProject .modal-body').html(data)
      error: ->
        $('#editProject .modal-body').html("ERROR")

  $('.new-document-button').click ->
    url = $(this).data('url')
    $.ajax
      url: url
      type: "GET"
      success: (data)->
        $('#newDocument .modal-body').html(data)
      error: ->
        $('#newDocument .modal-body').html("ERROR")

  clicked_on_link = false
  $("#subtasks tr").click ->
    if clicked_on_link is false
      #$(this).css "background", "yellow"
      $('#subtasks tr').removeClass('selected-task')
      $(this).addClass('selected-task')
      $.ajax
        type: "GET"
        url: $(this).attr("href-contact")
        data: ""
        cache: false
        beforeSend: ->
          #App.show_load()
          $(".task-details").html "Loading..."

        success: (txt) ->
          #App.hide_load()
          $(".task-details").html txt

        error: ->
          #App.hide_load()
          #App.show_error()

        stop: ->
          #App.hide_load()
          #App.show_error()