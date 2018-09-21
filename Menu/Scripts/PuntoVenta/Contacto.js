class Contacto {
    static get contactoSpan() {
        return document.getElementById('contactoSpan').innerHTML;
    }

    static get plusBtn() {
        return $('#addContactoButton');
    }

    static get inputGroups() {
        return $('[id^="PuntoVenta_Contactos"].input-group');
    }

    static tipo(idx) {
        return $('[id^="PuntoVenta_Contactos"][id$="_Tipo"]')[idx];
    }

    static dato(idx) {
        return $('[id^="PuntoVenta_Contactos"][id$="_Dato"]')[idx];
    }

    static removeBtn(idx) {
        return $('[id^="RemovePuntoVenta_Contactos"]')[idx];
    }

    static agregar(contacto) {
        $('#ListaContactos').append(contacto.inputGroup);
        contacto.addEventListeners();
        Contacto.plusBtn.addClass('disabled');
        if (Contacto.inputGroups.length > 1) {
            $(Contacto.removeBtn(0)).show();
        } else {
            $(contacto.removeBtn).hide();
        }
    }

    static agregarNuevo() {
        var nuevo = new Contacto();
        Contacto.agregar(nuevo);
        return nuevo;
    }

    static initPlusBtn() {
        Contacto.plusBtn.on('click', function () {
            if (!$(this).hasClass('disabled')) {
                Contacto.agregarNuevo();
            }
        });
    }

    static updatePlusBtn(idx) {
        if (Contacto.tipo(idx).value && Contacto.dato(idx).value) {
            Contacto.plusBtn.removeClass('disabled');
        }
        else {
            Contacto.plusBtn.addClass('disabled');
        }
    }

    constructor() {
        this.index = Contacto.inputGroups.length > 0 ? Contacto.inputGroups.length : 0;
        this.inputGroup = document.createElement('span');
        this.inputGroup.setAttribute('id', 'PuntoVenta_Contactos_' + this.index + '_');
        this.inputGroup.setAttribute('class', 'input-group');
        var re1 = new RegExp('\\[-]', 'g');
        var re2 = new RegExp('_-_', 'g');
        this.inputGroup.innerHTML = Contacto.contactoSpan.replace(re1, '[' + this.index + ']').replace(re2, '_' + this.index + '_');
    }

    get index() {
        return this._index;
    }
    set index(idx) {
        this._index = idx;
    }
    get tipo() {
        return Contacto.tipo(this.index);
    }
    get dato() {
        return Contacto.dato(this.index);
    }
    get removeBtn() {
        return Contacto.removeBtn(this.index);
    }
    get inputGroup() {
        return this._inputGroup;
    }
    set inputGroup(inputGroup) {
        this._inputGroup = inputGroup;
    }

    updatePlusBtn() {
        Contacto.updatePlusBtn(this.id[21]);
    }

    updateDatoField() {
        var dato = $('#' + this.id.replace('Tipo', 'Dato'));
        switch (this.value) {
            case 'Facebook':
                dato.val('http://www.facebook.com/');
                break;
            case 'Twitter':
                dato.val('http://www.twitter.com/');
                break;
            case 'Celular':
            case 'Local':
            case 'Whatsapp':
                dato.attr('type', 'tel');
                dato.attr('pattern', '[0-9]{10}');
                dato.attr('title', '10 dígitos');
                dato.val('');
                break;
        }
        Contacto.updatePlusBtn(this.id[21]);
    }

    remove() {
        this.parentNode.parentNode.removeChild(this.parentNode);
        if (Contacto.inputGroups.length == 1) {
            $(Contacto.removeBtn(0)).hide();
        }
        for (var i = this.id[27]; i < Contacto.inputGroups.length; i++) {
            var re1 = new RegExp('\\[' + Contacto.inputGroups[i].id[21] + ']', 'g');
            var re2 = new RegExp('_' + Contacto.inputGroups[i].id[21] + '_', 'g');
            Contacto.inputGroups[i].id = Contacto.inputGroups[i].id.replace(re2, '_' + i + '_');
            Contacto.tipo(i).id = Contacto.tipo(i).id.replace(re2, '_' + i + '_');
            Contacto.tipo(i).name = Contacto.tipo(i).name.replace(re1, '[' + i + ']');
            Contacto.dato(i).id = Contacto.dato(i).id.replace(re2, '_' + i + '_');
            Contacto.dato(i).name = Contacto.dato(i).name.replace(re1, '[' + i + ']');
            Contacto.removeBtn(i).id = Contacto.removeBtn(i).id.replace(re2, '_' + i + '_');
        }
        Contacto.updatePlusBtn(Contacto.inputGroups.length - 1)
    }

    addEventListeners() {
        $(this.tipo).on('change keyup paste', this.updateDatoField);
        $(this.dato).on('change keyup paste', this.updatePlusBtn);
        $(this.removeBtn).on('click', this.remove)
    }
}