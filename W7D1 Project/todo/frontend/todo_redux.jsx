//this is our main-entry file

import React from 'react';
import ReactDOM from 'react-dom';

import configureStore from './store/store';
import { receiveTodos, receiveTodo } from './actions/todo_actions';
import Root from './components/root';
import allTodos from './reducers/selectors';




document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();
  window.store = store;
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
  window.allTodos = allTodos;

  const rootEl = document.getElementById('root');

  ReactDOM.render(<Root store={store}/>, rootEl);
});
