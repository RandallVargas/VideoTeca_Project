function cambiarCorreo() {
    const botonCancelar = document.getElementsByClassName('btn-cancelar-correo')[0];
    const botonGuardar = document.getElementsByClassName('btn-correo')[0];
    const input = document.getElementById("inCorreo");

    if (botonCancelar.classList.contains('hidden')) {

        botonCancelar.classList.remove('hidden');

        botonGuardar.classList.remove('btn-warning');
        botonGuardar.classList.add('btn-success');
        botonGuardar.classList.add('input-change');
        botonGuardar.textContent = "Guardar";

        input.readOnly = false;
        input.classList.add('input-change');
    } else {
        hideButtonCorreo(botonCancelar, botonGuardar, input);
    }
}
function hideButtonCorreo(botonCancelar, botonCorreo, input) {
    botonCancelar.classList.add('hidden');

    botonCorreo.classList.remove('btn-success');
    botonCorreo.classList.remove('input-change');
    botonCorreo.classList.add('btn-warning');
    botonCorreo.textContent = "Cambiar Correo";

    input.readOnly = true;
    input.classList.remove('input-change');
}
function cambiarContrasena() {
    const botonCancelar = document.getElementsByClassName('btn-cancelar-contrasena')[0];
    const botonGuardar = document.getElementsByClassName('btn-contrasena')[0];
    const input = document.getElementById("inUsuario");
    const divContrasena = document.getElementById('table-contrasena');

    if (botonCancelar.classList.contains('hidden')) {

        botonCancelar.classList.remove('hidden');

        divContrasena.classList.remove('hidden');

        botonGuardar.classList.remove('btn-warning');
        botonGuardar.classList.add('btn-success');
        botonGuardar.classList.add('input-change');
        botonGuardar.textContent = "Guardar";

        input.classList.add('input-change');

    } else {
        hideButtonContrasena(botonCancelar, botonGuardar, input, divContrasena);
    }
}

function hideButtonContrasena(botonCancelar, botonGuardar, input, divContrasena) {
    botonCancelar.classList.add('hidden');
    divContrasena.classList.add('hidden');

    botonGuardar.classList.remove('btn-success');
    botonGuardar.classList.remove('input-change');
    botonGuardar.classList.add('btn-warning');
    botonGuardar.textContent = "Cambiar Contrase\u00F1a";

    input.classList.remove('input-change');
}