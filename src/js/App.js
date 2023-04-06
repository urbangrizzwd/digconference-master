import '/src/css/tailwind.css';

if (import.meta.hot) {
  import.meta.hot.accept(() => {
    console.log("HMR")
  });
}