//this is our main-entry file

import React from 'react';
import ReactDOM from 'react-dom';

import configureStore from './store/store';
import { receiveTodos, receiveTodo, fetchTodos } from './actions/todo_actions';
import Root from './components/root';
import allTodos from './reducers/selectors';




document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();
  window.store = store;
  window.fetchTodos = fetchTodos;
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
  window.allTodos = allTodos;

  const rootEl = document.getElementById('content');

  ReactDOM.render(<Root store={store}/>, rootEl);
});
