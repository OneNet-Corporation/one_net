import app from "./app";

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => {
  console.log(`OneNet Server is running on port ${PORT}`);
});