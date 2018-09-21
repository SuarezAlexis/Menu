class Ubicacion {
    static get Map() {
        return this._map;
    }

    static set Map(m) {
        this._map = m;
    }

    static get Marker() {
        return this._marker;
    }

    static set Marker(m) {
        this._marker = m;
    }

    static get MapProp() {
        return this._mapProp;
    }

    static set MapProp(mp) {
        this._mapProp = mp;
    }

    static get Dir() {
        return $('#Ubicacion_Direccion');
    }

    static get Nombre() {
        return $('#Ubicacion_Descripcion');
    }

    static get AddBtn() {
        return $('#addLocation');
    }

    static get Lat() {
        return $('#Ubicacion_Latitud');
    }

    static get Lng() {
        return $('#Ubicacion_Longitud');
    }

    static get re_id() {
        return this._re_id;
    }

    static set re_id(r) {
        this._re_id = r;
    }

    static get re_name() {
        return this._re_name;
    }

    static set re_name(r) {
        this._re_name = r;
    }

    static getNombre(idx) {
        return $('#PuntoVenta_Ubicaciones_' + idx + '__Descripcion');
    }

    static getDir(idx) {
        return $('#PuntoVenta_Ubicaciones_' + idx + '__Direccion');
    }

    static getLat(idx) {
        return $('#PuntoVenta_Ubicaciones_' + idx + '__Latitud');
    }

    static getLng(idx) {
        return $('#PuntoVenta_Ubicaciones_' + idx + '__Longitud');
    }

    static getEditBtn(idx) {
        return $('#EditUbicaciones_' + idx + '_');
    }

    static getRemoveBtn(idx) {
        return $('#RemoveUbicaciones_' + idx + '_');
    }

    static initMap(pos) {
        Ubicacion.re_name = new RegExp('\\[[-0-9]{1,}]', 'g');
        Ubicacion.re_id = new RegExp('_[-0-9]{1,}_', 'g');

        Ubicacion.MapProp = {
            center: new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude),
            zoom: 14
        };

        Ubicacion.Map = new google.maps.Map(document.getElementById("map"), Ubicacion.MapProp);
        Ubicacion.Marker = new google.maps.Marker({
            map: Ubicacion.Map,
            draggable: true,
            animation: google.maps.Animation.DROP,
            position: { lat: pos.coords.latitude, lng: pos.coords.longitude }
        });
        Ubicacion.Marker.addListener('dragend', Ubicacion.markerDragged);

        Ubicacion.updateHiddenLocation(pos.coords.latitude, pos.coords.longitude)

        $('#search-in-map').on('click', function () {
            if (Ubicacion.Dir.val()) {
                var geocoder = new google.maps.Geocoder;
                geocoder.geocode({ 'address': Ubicacion.Dir.val() }, function (results, status) {
                    if (status === 'OK') {
                        if (results[0]) {
                            Ubicacion.Map.setCenter(results[0].geometry.location);
                            Ubicacion.Marker.setPosition(results[0].geometry.location);
                            Ubicacion.updateHiddenLocation(results[0].geometry.location.lat, results[0].geometry.location.lng);
                        }
                        else {
                            window.alert('No logramos encontrar la dirección ingresada, por favor indícala en el mapa.');
                        }
                    }
                    else {
                        window.alert('Falló la geolocalización. Código de error: ' + status);
                    }
                });
            }
            else {
                alert('Primero ingresa una dirección para buscarla en el mapa.');
            }
        });

        $('#get-from-marker').on('click', function () {
            var geocoder = new google.maps.Geocoder;
            geocoder.geocode({ 'location': Ubicacion.Marker.getPosition() }, function (results, status) {
                if (status === 'OK') {
                    if (results[0]) {
                        Ubicacion.Dir.val(results[0].formatted_address);
                        Ubicacion.AddBtn.removeClass('disabled');
                    }
                    else {
                        window.alert("No fue posible encontrar la dirección del punto seleccionado.");
                    }
                }
                else {
                    window.alert('Falló la geolocalización. Código de error: ' + status);
                }
            });
        })

        Ubicacion.AddBtn.on('click', function () {
            if (!$(this).hasClass('disabled')) {
                var idx = $('#ListaUbicaciones').children().length;
                var locationDiv = document.createElement('li');
                locationDiv.setAttribute('id', 'PuntoVenta_Ubicaciones_' + idx + '_');
                locationDiv.setAttribute('name', 'PuntoVenta.Ubicaciones[' + idx + ']');
                locationDiv.innerHTML = $('#ubicacionLi').html().replace(Ubicacion.re_name, '[' + idx + ']').replace(Ubicacion.re_id, '_' + idx + '_');
                $('#ListaUbicaciones').append(locationDiv);
                Ubicacion.getLat(idx).val(Ubicacion.Lat.val());
                Ubicacion.getLng(idx).val(Ubicacion.Lng.val());
                Ubicacion.getNombre(idx).val(Ubicacion.Nombre.val());
                Ubicacion.getDir(idx).val(Ubicacion.Dir.val());
                if (!Ubicacion.Nombre.val()) {
                    $('#Ubicaciones_' + idx + '__Descripcion').html('sin-título');
                }
                else {
                    $('#Ubicaciones_' + idx + '__Descripcion').html(Ubicacion.Nombre.val());
                }
                $('#Ubicaciones_' + idx + '__Direccion').html(Ubicacion.Dir.val());
                Ubicacion.Nombre.val('');
                Ubicacion.Dir.val('');
                Ubicacion.AddBtn.addClass('disabled');

                //Listenners
                Ubicacion.getRemoveBtn(idx).on('click', { 'idx': idx }, Ubicacion.removeUbicacion);
                Ubicacion.getEditBtn(idx).on('click', { 'idx': idx }, Ubicacion.editUbicacion);
            }
        });
    }

    static initDireccion() {
        Ubicacion.Dir.on('change keyup paste', function () {
            if ($(this).val()) {
                Ubicacion.AddBtn.removeClass('disabled');
            }
            else {
                Ubicacion.AddBtn.addClass('disabled');
            }
        });
    }

    static removeUbicacion(e) {
        var idx = e.data.idx;
        $('#PuntoVenta_Ubicaciones_' + idx + '_').remove();
        for (var i = idx; i < $('#ListaUbicaciones').children().length; i++) {
            $('#ListaUbicaciones').children()[i].id = $('#ListaUbicaciones').children()[i].id.replace(Ubicacion.re_id, '_' + i + '_');
            $('#ListaUbicaciones').children()[i].setAttribute('name', $('#ListaUbicaciones').children()[i].getAttribute('name').replace(Ubicacion.re_name, '[' + i + ']'));
            $('#ListaUbicaciones').children()[i].innerHTML = $('#ListaUbicaciones').children()[i].innerHTML.replace(Ubicacion.re_name, '[' + i + ']').replace(Ubicacion.re_id, '_' + i + '_')
            Ubicacion.getRemoveBtn(i).on('click', { 'idx': i }, Ubicacion.removeUbicacion);
            Ubicacion.getEditBtn(i).on('click', { 'idx': i }, Ubicacion.editUbicacion);
        }
    }

    static editUbicacion(e) {
        var idx = e.data.idx;
        Ubicacion.Nombre.val(Ubicacion.getNombre(idx).val());
        Ubicacion.Dir.val(Ubicacion.getDir(idx).val());
        Ubicacion.Lng.val(Ubicacion.getLng(idx).val());
        Ubicacion.Lat.val(Ubicacion.getLat(idx).val());
        Ubicacion.Marker.setPosition({ 'lat': parseFloat(Ubicacion.Lat.val()), 'lng': parseFloat(Ubicacion.Lng.val()) });
        Ubicacion.Map.setCenter(Ubicacion.Marker.getPosition());
        Ubicacion.AddBtn.removeClass('disabled');
        Ubicacion.removeUbicacion({ 'data': { 'idx': idx } });
    }

    static markerDragged(e) {
        Ubicacion.updateHiddenLocation(e.latLng.lat, e.latLng.lng);
    }

    static updateHiddenLocation(lat, lng) {
        Ubicacion.Lat.val(lat);
        Ubicacion.Lng.val(lng);
    }

}

function myMap() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(Ubicacion.initMap);
    }
    else {
        alert('Geolocalización no soportada por el navegador.');
    }
};
