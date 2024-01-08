
document.addEventListener('DOMContentLoaded', function () {
  checkCardTextOverflow();
});

function checkCardTextOverflow() {
  var cardTexts = document.querySelectorAll('.card-text');
  cardTexts.forEach(function (card) {
    var button = card.nextElementSibling;
    if (button && card.scrollHeight > card.clientHeight) {
      button.style.display = 'block';
    } else if (button) {
      button.style.display = 'none';
    }
  });
}
