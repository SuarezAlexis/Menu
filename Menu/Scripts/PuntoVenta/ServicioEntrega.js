class ServicioEntrega {
    static get servicioSpan() {
        return document.getElementById('servicioSpan').innerHTML;
    }

    static get plusBtn() {
        return $('#addServicioEntregaButton');
    }

    static get inputGroups() {
        return $('[id^="PuntoVenta_ServiciosEntrega"].input-group');
    }

    static nombre(idx) {
        return $('[id^="PuntoVenta_ServiciosEntrega"][id$="_Nombre"]')[idx];
    }

    static removeBtn(idx) {
        return $('[id^="RemovePuntoVenta_ServiciosEntrega"]')[idx];
    }

    static agregar(servicio) {
        $('#ListaServiciosEntrega').append(servicio.inputGroup);
        servicio.addEventListeners();
        ServicioEntrega.plusBtn.addClass('disabled');
        if (ServicioEntrega.inputGroups.length > 1) {
            $(ServicioEntrega.removeBtn(0)).show();
        } else {
            $(servicio.removeBtn).hide();
        }
    }

    static agregarNuevo() {
        var nuevo = new ServicioEntrega();
        ServicioEntrega.agregar(nuevo);
        return nuevo;
    }

    static initPlusBtn() {
        ServicioEntrega.plusBtn.on('click', function () {
            if (!$(this).hasClass('disabled')) {
                ServicioEntrega.agregarNuevo();
            }
        });
    }

    static updatePlusBtn(idx) {
        if (ServicioEntrega.nombre(idx).value) {
            ServicioEntrega.plusBtn.removeClass('disabled');
        }
        else {
            ServicioEntrega.plusBtn.addClass('disabled');
        }
    }

    constructor() {
        this.index = ServicioEntrega.inputGroups.length > 0 ? ServicioEntrega.inputGroups.length : 0;
        this.inputGroup = document.createElement('span');
        this.inputGroup.setAttribute('id', 'PuntoVenta_ServiciosEntrega_' + this.index + '_');
        this.inputGroup.setAttribute('class', 'input-group');
        var re1 = new RegExp('\\[-]', 'g');
        var re2 = new RegExp('_-_', 'g');
        this.inputGroup.innerHTML = ServicioEntrega.servicioSpan.replace(re1, '[' + this.index + ']').replace(re2, '_' + this.index + '_');
    }

    get index() {
        return this._index;
    }
    set index(idx) {
        this._index = idx;
    }
    get nombre() {
        return ServicioEntrega.nombre(this.index);
    }
    get removeBtn() {
        return ServicioEntrega.removeBtn(this.index);
    }
    get inputGroup() {
        return this._inputGroup;
    }
    set inputGroup(inputGroup) {
        this._inputGroup = inputGroup;
    }

    updatePlusBtn() {
        ServicioEntrega.updatePlusBtn(this.id[28]);
    }

    remove() {
        this.parentNode.parentNode.removeChild(this.parentNode);
        if (ServicioEntrega.inputGroups.length == 1) {
            $(ServicioEntrega.removeBtn(0)).hide();
        }
        for (var i = this.id[34]; i < ServicioEntrega.inputGroups.length; i++) {
            var re1 = new RegExp('\\[' + ServicioEntrega.inputGroups[i].id[28] + ']', 'g');
            var re2 = new RegExp('_' + ServicioEntrega.inputGroups[i].id[28] + '_', 'g');
            ServicioEntrega.inputGroups[i].id = ServicioEntrega.inputGroups[i].id.replace(re2, '_' + i + '_');
            ServicioEntrega.nombre(i).id = ServicioEntrega.nombre(i).id.replace(re2, '_' + i + '_');
            ServicioEntrega.nombre(i).name = ServicioEntrega.nombre(i).name.replace(re1, '[' + i + ']');
            ServicioEntrega.removeBtn(i).id = ServicioEntrega.removeBtn(i).id.replace(re2, '_' + i + '_');
        }
        ServicioEntrega.updatePlusBtn(ServicioEntrega.inputGroups.length - 1)
    }

    addEventListeners() {
        $(this.nombre).on('change keyup paste', this.updatePlusBtn);
        $(this.removeBtn).on('click', this.remove)
    }

}