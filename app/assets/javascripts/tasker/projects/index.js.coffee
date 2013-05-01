Tasker.Projects = {} if Tasker.Projects is undefined

Tasker.Projects.Index = ->
  $('.new-project-button').click ->
    url = $(this).data('url')
    $.ajax
      url: url
      type: "GET"
      success: (data)->
        $('#newProject .modal-body').html(data)
      error: ->
        $('#newProject .modal-body').html("ERROR")