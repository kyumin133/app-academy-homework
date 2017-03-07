import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);
  const root = document.getElementById('content');

  const newStore = applyMiddlewares(store, addLoggingToDispatch);
  // console.log(store);
  // console.log(newStore);
  ReactDOM.render(<Root store={newStore} />, root);
});

const addLoggingToDispatch = (store) => (next) => (action) => {
  const oldDispatch = store.dispatch;
  console.log(store.getState());
  console.log(action);
  let returnValue = oldDispatch(action);
  console.log(store.getState());
  return returnValue;
};

const applyMiddlewares = (store, ...middlewares) => {
  let dispatch = store.dispatch;
  // console.log(dispatch);
  middlewares.forEach((middleware) => {
    dispatch = middleware(store)(dispatch);
  });
  // console.log(dispatch);
  return Object.assign({}, store, { dispatch });
}
