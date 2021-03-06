﻿$(document).ajaxStart(function () {
    $('#loading').show();
});
$(document).ajaxComplete(function () {
    $('#loading').hide();
});

function isUploadSupported() {
    if (navigator.userAgent.match(/(Android (1.0|1.1|1.5|1.6|2.0|2.1))|(Windows Phone (OS 7|8.0))|(XBLWP)|(ZuneWP)|(w(eb)?OSBrowser)|(webOS)|(Kindle\/(1.0|2.0|2.5|3.0))/)) {
        return false;
    }
    var elem = document.createElement('input');
    elem.type = 'file';
    return !elem.disabled;
};

function readFile(file) {
    var reader = new FileReader();

    reader.onloadend = function () {
        processFile(reader.result, file.type);
    }

    reader.onerror = function () {
        alert('There was an error reading the file!');
    }

    reader.readAsDataURL(file);
}

function processFile(dataURL, fileType) {
    var maxWidth = 800;
    var maxHeight = 800;

    var image = new Image();
    image.src = dataURL;

    image.onload = function () {
        var width = image.width;
        var height = image.height;
        var shouldResize = (width > maxWidth) || (height > maxHeight);

        if (!shouldResize) {
            sendFile(dataURL);
            return;
        }

        var newWidth;
        var newHeight;

        if (width > height) {
            newHeight = height * (maxWidth / width);
            newWidth = maxWidth;
        } else {
            newWidth = width * (maxHeight / height);
            newHeight = maxHeight;
        }

        var canvas = document.createElement('canvas');

        canvas.width = newWidth;
        canvas.height = newHeight;

        var context = canvas.getContext('2d');

        context.drawImage(this, 0, 0, newWidth, newHeight);

        dataURL = canvas.toDataURL(fileType);

        sendFile(dataURL);
    };

    image.onerror = function () {
        alert('There was an error processing your file!');
    };
}

function sendFile(fileData) {
    var formData = new FormData();

    formData.append('imageData', fileData);

    $.ajax({
        type: 'POST',
        url: '/Alimento/Imagen',
        data: formData,
        contentType: false,
        processData: false,
        success: function (data) {
            if (data.success) {
                $('.main-pic').html('<div class="pull-left img-wrapper"> <img class="img-responsive thumbnail" src="Content/uploads/' + data.fileName + '" width="100%" /> </div>');
            } else {
                alert('There was an error uploading your file!');
            }
        },
        error: function (data) {
            alert('There was an error uploading your file!');
        }
    });
}