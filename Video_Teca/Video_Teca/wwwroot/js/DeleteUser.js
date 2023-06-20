function deleteUser() {
    var username = $(this).data("user-username");
    document.getElementById('btn-validado-eliminar-cuenta').addEventListener('click', function () {

        $.ajax({
            url: "/UserAuthentication/DeleteUser",
            type: "POST",
            data: { user: username },
            success: function () {                
                    location.reload();             
            },
            error: function () {

                var modal = new bootstrap.Modal(document.getElementById('modal-user-deleted'));
                modal.show();
            }
        });
    });

    var modal = new bootstrap.Modal(document.getElementById('modal-delete')); //Muestra un pop-up informando la accion realizada
    modal.show();
}

function deleteUserByDetails() {
    var username = $(this).data("user-username");
    document.getElementsByClassName('btn-validado-eliminar')[0].addEventListener('click', function () {

        $.ajax({
            url: "/UserAuthentication/DeleteUser",
            type: "POST",
            data: { user: username },
            success: function (response) {
                window.location.href = '/Admin/UserAdministration';
            }, 

            error: function () {

                var modal = new bootstrap.Modal(document.getElementById('modal-user-deleted'));
                modal.show();
            }
        });
    });

    var modal = new bootstrap.Modal(document.getElementById('modal-delete')); //Muestra un pop-up informando la accion realizada
    modal.show();
}