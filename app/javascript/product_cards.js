// Asegúrate de que el evento 'DOMContentLoaded' esté vinculado para que se ejecute cuando el DOM esté completamente cargado.
document.addEventListener('DOMContentLoaded', function () {
  checkCardTextOverflow();
});

// Si estás utilizando AJAX o cargando contenido dinámicamente, asegúrate de llamar a esta función después de que el contenido se cargue.
function checkCardTextOverflow() {
  var cardTexts = document.querySelectorAll('.card-text');

  cardTexts.forEach(function (card) {
    var button = card.nextElementSibling; // Asegúrate de que este es tu botón "Ver más".
    // Verifica si el botón existe y si el texto sobrepasa el contenedor.
    if (button && card.scrollHeight > card.clientHeight) {
      button.style.display = 'block'; // Muestra el botón Ver más.
    } else if (button) {
      button.style.display = 'none'; // Oculta el botón Ver más si el texto no sobrepasa.
    }
  });
}
