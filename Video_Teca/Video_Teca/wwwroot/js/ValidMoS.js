
    function toggleFields() {

        var mediaType = document.getElementById("media_type").value;
        var numSeasonsField = document.getElementById("num_seasons");
        var numEpisodesField = document.getElementById("num_episodes");
        var episodeDurationField = document.getElementById("episode_duration");
        console.log("Script cargado");
        if (mediaType === "movie") {
            numSeasonsField.value = ""; // Vacía el valor del campo
            numSeasonsField.disabled = true; // Deshabilita el campo
            numEpisodesField.value = "";
            numEpisodesField.disabled = true;
            episodeDurationField.value = "";
            episodeDurationField.disabled = true;

            // Opcional: Oculta los campos deshabilitados
            numSeasonsField.classList.add("hidden-field");
            numEpisodesField.classList.add("hidden-field");
            episodeDurationField.classList.add("hidden-field");
        } else {
            numSeasonsField.disabled = false; // Habilita el campo
            numEpisodesField.disabled = false;
            episodeDurationField.disabled = false;

            // Opcional: Muestra los campos habilitados
            numSeasonsField.classList.remove("hidden-field");
            numEpisodesField.classList.remove("hidden-field");
            episodeDurationField.classList.remove("hidden-field");
        }
    }
