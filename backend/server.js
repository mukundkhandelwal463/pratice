const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/api/message', (req, res) => {
  res.json({
    message: 'Hello from Node! This is a sample HTML/CSS/JS app.'
  });
});

app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
