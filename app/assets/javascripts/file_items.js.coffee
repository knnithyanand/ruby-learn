# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
    $('#new_file_item').fileupload
        dataType: "script"
        add: (e, data) ->
            badge = $("#file-upload-ctrl").parent().find("div span label span").filter( ".badge" )
            $("#file-upload-ctrl").filestyle('disabled', true);
            data.submit()
        done: (e, data) ->
            badge = $("#file-upload-ctrl").parent().find("div span label span").filter( ".badge" )
            num = parseInt(badge.text()) - 1
            if num == 0
                $("#file-upload-ctrl").filestyle('disabled', false);
                badge.remove()
            else
                badge.html(num)
