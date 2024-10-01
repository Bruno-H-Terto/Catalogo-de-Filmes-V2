document.addEventListener('turbo:load', () => {
  const img = document.querySelector('.exit-img');
  const notification = document.querySelector('.notification');

  if (img && notification) {
    img.addEventListener('click', function() {
      notification.style.display = 'none';
    });
  }
});
