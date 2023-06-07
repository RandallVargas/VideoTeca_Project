var btnpopup = document.getElementById('btn-popup'),
    overlay = document.getElementById('overlay'),
    popup = document.getElementById('popup'),
    btncerrarpopup = document.getElementById('btn-cerrar-popup');

btnpopup.addEventListener('click', function () {
    overlay.classList.add('active');
    popup.classList.add('active');
   
});
btncerrarpopup.addEventListener('click', function () {
    overlay.classList.remove('active');
    popup.classList.remove('active');
});