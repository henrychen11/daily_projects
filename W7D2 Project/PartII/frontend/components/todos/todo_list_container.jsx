import React from 'react';
import TodoList from './todo_list';
import allTodos from '../../reducers/selectors';
import { fetchTodos, createTodo } from '../../actions/todo_actions';
import { connect } from 'react-redux';


const mapStateToProps = (state) => ({
  todos: allTodos(state),
  errors: state.errors
});

const mapDispatchToProps = dispatch => ({
  createTodo: (todo) => dispatch(createTodo(todo)),
  fetchTodos: () => dispatch(fetchTodos())
});

export default connect(mapStateToProps, mapDispatchToProps)(TodoList);
