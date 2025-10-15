// src/index.js
const express = require('express');
const mongoose = require('mongoose');
const todosRouter = require('./routes/todos');
const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());
app.use('/todos', todosRouter);
app.get('/', (req, res) => {
  res.send('Todo API is running 🚀');
});


const start = async () => {
  const mongoUri = process.env.MONGO_URI || 'mongodb://mongo:27017/todos_db';
  try {
    await mongoose.connect(mongoUri, { useNewUrlParser: true, useUnifiedTopology: true });
    console.log('Connected to MongoDB');
    app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
  } catch (err) {
    console.error('Failed to start', err);
    process.exit(1);
  }
};

start();