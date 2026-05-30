const messageEl = document.getElementById('message');
const fetchButton = document.getElementById('fetchButton');

fetchButton.addEventListener('click', async () => {
  try {
    const response = await fetch('/api/message');
    const data = await response.json();
    messageEl.textContent = data.message;
  } catch (error) {
    messageEl.textContent = 'Failed to fetch message. Open the terminal and run npm install first.';
    console.error(error);
  }
});
