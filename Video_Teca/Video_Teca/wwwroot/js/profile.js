function showButtonCancelar(botonCancelar, botonGuardar, input) {
    botonCancelar.classList.remove('hidden');

    botonGuardar.classList.remove('btn-warning');
    botonGuardar.classList.add('btn-success');
    botonGuardar.classList.add('input-change');
    botonGuardar.textContent = "Guardar";

    input.readOnly = false;
    input.classList.add('input-change');
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

function showButtonContrasena(botonCancelar, botonGuardar, input, divContrasena){
    botonCancelar.classList.remove('hidden');

    divContrasena.classList.remove('hidden');

    botonGuardar.classList.remove('btn-warning');
    botonGuardar.classList.add('btn-success');
    botonGuardar.classList.add('input-change');
    botonGuardar.textContent = "Guardar";

    input.classList.add('input-change');

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