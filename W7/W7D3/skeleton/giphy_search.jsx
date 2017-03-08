import React from 'react';
import ReactDOM from 'react-dom';
import { configureStore}  from './store/store';
import Root from './components/root';
// import {} from './util/api_util'

document.addEventListener("DOMContentLoaded", () => {
  // fetchSearchGiphys("puppies").then((res) => console.log(res.data));
  const store = configureStore();
  window.store = store;
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
});
