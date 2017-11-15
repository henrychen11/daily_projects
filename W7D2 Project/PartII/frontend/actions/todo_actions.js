import * as APIUtil from '../util/todo_api_util';
import { receiveErrors } from './error_actions';

export const RECEIVE_TODOS = 'RECEIVE_TODOS';
export const RECEIVE_TODO = 'RECEIVE_TODO';
export const REMOVE_TODO = 'REMOVE_TODO';

export const receiveTodos = (todos) => ({
  type: RECEIVE_TODOS,
  todos
});

export const receiveTodo = (todo) => ({
  type: RECEIVE_TODO,
  todo
});

export const removeTodo = (todo) => ({
  type: REMOVE_TODO,
  todo
});



export const fetchTodos = () => dispatch => (
  APIUtil.fetchTodos().then(todos => dispatch(receiveTodos(todos)))
);

export const createTodo = (todo) => dispatch => (
  APIUtil.createTodo(todo)
    .then(
      newTodo => dispatch(receiveTodo(newTodo)),
      err => dispatch(receiveErrors(err.responseJSON))
    )
  //first todo is the todo we pass in from createTodo, 2nd todo is the one we get back from the ajax request. We can name the second one something else (like backend_todo)
);


// const newTodos = [
//   {
//     id: 1,
//     title: 'wash car',
//     body: 'with soap',
//     done: false
//   },
//   {
//     id: 2,
//     title: 'wash dog',
//     body: 'with shampoo',
//     done: true
//   }
// ]
