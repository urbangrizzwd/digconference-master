import '/src/css/tailwind.css';

if (import.meta.hot) {
  import.meta.hot.accept(() => {
    console.log("HMR")
  });
}

const buttons = document.querySelectorAll('button');
const cards = document.querySelectorAll('.workshop-card')
buttons && buttons.forEach((button) => {
  button.addEventListener('click', (e) => {

    const className = button.querySelector('p').innerText;
    e.preventDefault()

    // Loop through cards

    cards && cards.forEach((card) => {
      const categories = card.dataset.categories
      console.log(className);
      const formated = categories.replace(/[|]/g, '').split(',');
      console.log(formated.length);
      if (formated.includes(className)) {
        card.style.display = "block";
      } else {
        card.style.display = "none";
      }
    })
  })
})