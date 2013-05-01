#= require_self
#= require_tree .

window.Tasker =
  Common:
    initPage: ->
      # If you're using the Turbolinks and you need run a code only one time, put something here.
      # if you're not using the turbolinks, there's no difference between init and initPage.

    init: ->
      # Something here. This is called in every page, with or without Turbolinks.
      # toggle links 
      $(".toggle-link").click (e) ->
        target = $($(this).attr("href")).toggleClass("hidden")

        #$.scrollTo(target);
        e.preventDefault()

    finish: ->
      # Something here. This is called in every page, with or without Turbolinks.

