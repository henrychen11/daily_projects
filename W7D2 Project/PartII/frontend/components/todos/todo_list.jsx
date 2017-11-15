import React from 'react';
import ToDoListItem from './todo_list/todo_list_item';
import TodoForm from './todo_list/todo_form';
// import receiveTodo from '../../actions/todo_actions';

class TodoList extends React.Component {

  componentDidMount () {
    this.props.fetchTodos();
  }


  render() {
    let { todos, createTodo, errors } = this.props;
    return (
      <div>
        <h1>Our Todo List</h1>
        <ul>
          {
            todos.map( (todo, index) => (
              <ToDoListItem key={index} todo={todo}/>
            ))
          }
        </ul>
        <br />
        <TodoForm errors={errors} createTodo={createTodo}/>
      </div>
    );
  }
}



export default TodoList;
