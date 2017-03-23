// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
// # $(document).on 'turbolinks:load', ->
// #   $('#new_user').on 'submit', (event) ->
// #     # alert("hi")
// #     event.preventDefault()
// #     data = $('#new_user').serializeArray()
// #     $.ajax(
// #       url: "/users"
// #       method: "POST"
// #       data: data
// #       success: (response) ->
// #         )

$(document).on('turbolinks:load', function(){
  $('#new_user').on('submit', function(event){
    event.preventDefault()
    // myEvent = event
    data = $('#new_user').serializeArray()
    $.ajax({
      url: "/users",
      method: "POST",
      data: data,
      success: function(response){
        pTag = document.createElement('p')
        pTag.innerText = $(response)[0]
        pTag.style.color = "red";
        submitButton = $('input[type="submit"]')[0]
        errorMessage = $(submitButton).parent()
        $(errorMessage).prepend(pTag)
        }
      })
    })
  })
