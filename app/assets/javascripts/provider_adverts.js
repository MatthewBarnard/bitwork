provider_adverts = {}
provider_adverts.init = function () {
    $(document).off('click', '#refresh_map')
    $(document).on('click', '#refresh_map', function (e) {
        e.preventDefault();

        provider_adverts.loadmap($('#entered_address').val())
        provider_adverts.loadmap($('#input_address').val())
        $('html, body').animate({
            scrollTop: $("#map").offset().top
        }, 500);
    })
}
provider_adverts.loadmap = function (address) {
    var map;
    geocoder = new google.maps.Geocoder();
    geocoder.geocode({
        'address': address
    }, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            var myOptions = {
                zoom: 13,
                center: results[0].geometry.location,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            }
            map = new google.maps.Map(document.getElementById("map"), myOptions);

            var marker = new google.maps.Marker({
                map: map,
                position: results[0].geometry.location
            });
            load_abs_address(results[0].formatted_address)
        }
    });

    function load_abs_address(address){
        $('#entered_address').val(address)
        $('#input_address').val(address)
    }
}