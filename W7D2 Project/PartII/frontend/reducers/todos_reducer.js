import { REMOVE_TODO, RECEIVE_TODO, RECEIVE_TODOS } from '../actions/todo_actions';

const initialState = {
  1: {
    id: 1,
    title: 'wash car',
    body: 'with soap',
    done: false
  },
  2: {
    id: 2,
    title: 'wash dog',
    body: 'with shampoo',
    done: true
  },
};

const todosReducer = (state = initialState, action) => {
  Object.freeze(state);
  let newState = {};

  switch(action.type) {
    case RECEIVE_TODOS:
    // console.log(action.todos);
      action.todos.forEach( (todo, index) => {
        newState[index] = todo;
      });
      return newState;

    case RECEIVE_TODO:
      newState = Object.assign({}, state);
      newState[action.todo.id] = action.todo;
      // debugger;
      return newState;

    case REMOVE_TODO:


    default:
      return state;
  }
};

export default todosReducer;
