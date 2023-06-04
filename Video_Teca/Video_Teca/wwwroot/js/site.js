// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

function cambiarImagen(input) {  //Cambia la imagen por la seleccionada
    if (input.files && input.files[0]) {
        var leer = new FileReader();
        leer.onload = function (e) {
            document.getElementsByClassName("img-profile")[0].setAttribute("src", e.target.result);

            var bytesArchivo = new Uint8Array(e.target.result);
            console.log(e.target);
            var bytesArchivo = new Uint8Array(e.target);
            // Realiza las operaciones necesarias con los bytes del archivo
            console.log(bytesArchivo);
        }

        leer.readAsDataURL(input.files[0]);
    }

}
