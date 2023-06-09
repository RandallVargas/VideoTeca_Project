function LoadUserData() {
    var ImageBytes = localStorage.getItem('bytesImg');
    var outputElement = document.getElementById('img-perfil');
    outputElement.src = 'data:image/webp;base64,' + ImageBytes;
}
