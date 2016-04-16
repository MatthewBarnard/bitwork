registration = {}
search = {}
login = {}

login.initialize = function () {
    $(document).on('click','#login_button', function () {
        if ($('#keep_me_logged_in').is(":checked")) {
            localStorage.setItem("stay_logged_in", "true");
        } else {
            localStorage.setItem("stay_logged_in", "false");
        }
    })
}

registration.validation = function () {
    $(document).on('click','#submit_button', function () {
        var validation_message = ''
        $("input[required='required']").each(function (i, o) {
            if ($(o).val().length == 0)
                validation_message = $(o).attr('validation_message')
        })
        if (validation_message == ''){
            show_loader('Registering...')
            $('#required_form').submit();
        } else {
            show_validation(validation_message)
        }
    })
}

search.initialize = function () {
    $(document).on('click', '#find_button', function(e) {
        e.preventDefault();
        window.location = '/search/' + $('#search_field').val();
    })

    $(document).on('click', '#results_search_button', function (e) {
        e.preventDefault();
        window.location = '/search/' + $('#search').val();
    })
}

//GENERAL FUNCTIONS
function show_loader(text){
    $('#loader_text_display').html(text)
    $('#loader').fadeIn('fast', function () {
        $('#loader_text').fadeIn('fast')
    })
}

function show_validation(message) {
    $('#validation_message').html(message)
    $('#validation_modal').modal('show')
}