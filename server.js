const express = require('express');
const path = require('path');
const app = express();
const port = process.env.PORT || 3000;

app.use(express.static(path.join(__dirname, 'public')));

app.get('/api/message', (req, res) => {
  res.json({
    message: 'Hello from Node! This is a sample HTML/CSS/JS app.'
  });
});

app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
