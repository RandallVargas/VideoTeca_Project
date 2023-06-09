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

function logout() {
    localStorage.clear();
    $.ajax({
        url: '/UserAuthentication/Logout',
        type: 'POST',
        success: function (response) {
            window.location.href = response; // Redireccionar a la página de login
        },
        error: function (xhr, status, error) {
            // Manejar el error, si es necesario
        }
    });
}
