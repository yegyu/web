'use strict';
/**
// ||||||||||||||||||||||||||||||| \\
//	Global Object $: Generic controls
// ||||||||||||||||||||||||||||||| \\
**/
(function () {
    // http://stackoverflow.com/questions/4083351/what-does-jquery-fn-mean
    var $ = function (elem) {
        if (!(this instanceof $)) {
            return new $(elem);
        }
        this.el = document.getElementById(elem);
    };
    window.$ = $;
    $.prototype = {
        onChange: function (callback) {
            this.el.addEventListener('change', callback);
            return this;
        }
    };
})();
/**
// ||||||||||||||||||||||||||||||| \\
//	Drag and Drop code for Upload
// ||||||||||||||||||||||||||||||| \\
**/
var dragdrop = {
    init: function (elem) {
        elem.setAttribute('ondrop', 'dragdrop.drop(event)');
        elem.setAttribute('ondragover', 'dragdrop.drag(event)');
    },
    drop: function (e) {
        e.preventDefault();
        var file = e.dataTransfer.files[0];

        runUpload(file);
    },
    drag: function (e) {
        e.preventDefault();
    }
};

/**
// ||||||||||||||||||||||||||||||| \\
//	Code to capture a file (image) 
//  and upload it to the browser
// ||||||||||||||||||||||||||||||| \\
**/
var user1 = document.getElementById('userActions1');
var user2 = document.getElementById('userActions2');
var user3 = document.getElementById('userActions3');
var user4 = document.getElementById('userActions4');
function runUpload(file) {

    // http://stackoverflow.com/questions/12570834/how-to-preview-image-get-file-size-image-height-and-width-before-upload
    if (file.type === 'image/png' ||
        file.type === 'image/jpg' ||
        file.type === 'image/jpeg' ||
        file.type === 'image/gif' ||
        file.type === 'image/bmp') {
        var reader = new FileReader(),
            image = new Image();
        reader.readAsDataURL(file);

        reader.onload = function (_file) {
            // if (event.type == 'mousedown') {
            // document.getElementById('imgPrime1').onmouseup = function () { mouseUp1() };
            // document.getElementById('imgPrime2').onmouseup = function () { mouseUp2() };
            //  if(document.getElementById('imgPrime1').onmouseup){

            if (user1.className == 'dad hovered') {
                $('imgPrime1').el.src = _file.target.result;
                $('imgPrime1').el.style.display = 'inline';
            } else if (user2.className == 'dad hovered') {
                $('imgPrime2').el.src = _file.target.result;
                $('imgPrime2').el.style.display = 'inline';
            } else if (user3.className == 'dad hovered') {
                $('imgPrime3').el.src = _file.target.result;
                $('imgPrime3').el.style.display = 'inline';
            }else if (user4.className == 'dad hovered') {
                $('imgPrime4').el.src = _file.target.result;
                $('imgPrime4').el.style.display = 'inline';
            }

        } // END reader.onload()
    } // END test if file.type === image
}

/**
// ||||||||||||||||||||||||||||||| \\
//	window.onload fun
// ||||||||||||||||||||||||||||||| \\
**/
window.onload = function () {
    if (window.FileReader) {
        // Connect the DIV surrounding the file upload to HTML5 drag and drop calls
        dragdrop.init($('userActions1').el);
        dragdrop.init($('userActions2').el);
        dragdrop.init($('userActions3').el);
        dragdrop.init($('userActions4').el);
        //	Bind the input[type="file"] to the function runUpload()
        // if (!document.getElementById('fileUpload1').src.value)
        $('fileUpload1').onChange(function () { runUpload(this.files[0]); });
        // if (!document.getElementById('fileUpload2').src.value)
        $('fileUpload2').onChange(function () { runUpload(this.files[0]); });
        $('fileUpload3').onChange(function () { runUpload(this.files[0]); });
        $('fileUpload4').onChange(function () { runUpload(this.files[0]); });

    } else {
        // Report error message if FileReader is unavilable
        var p = document.createElement('p'),
            msg = document.createTextNode('Sorry, your browser does not support FileReader.');
        p.className = 'error';
        p.appendChild(msg);
        $('userActions1').el.innerHTML = '';
        $('userActions1').el.appendChild(p);
        $('userActions2').el.innerHTML = '';
        $('userActions2').el.appendChild(p);
        $('userActions3').el.innerHTML = '';
        $('userActions3').el.appendChild(p);
        $('userActions4').el.innerHTML = '';
        $('userActions4').el.appendChild(p);
    }
};




var cX;
var sX;
var cY;
var sY;
var msg;
var res;
function checkPosition(event) {
    sX = event.screenX;
    cX = event.clientX;
    cY = event.clientY;
    sY = event.screenY;
    res = document.getElementById("coordi");
    msg = "cX : " + cX + ", cY : " + cY + "sX : " + sX + ", sY : " + sY;
    res.innerHTML = msg;
}
const empties = document.querySelectorAll('.dad');

for (const empty of empties) {
    // empty.addEventListener('dragover', dragOver);
    empty.addEventListener('mouseenter', dragEnter);
    empty.addEventListener('mouseleave', dragLeave);
    empty.addEventListener('dragenter', dragEnter);
    empty.addEventListener('dragleave', dragLeave);
    // empty.addEventListener('drop', dragDrop);
}

function dragEnter(e) {
    e.preventDefault();
    this.classList.toggle('hovered');
}

function dragLeave() {
    this.classList.remove('hovered');
}
