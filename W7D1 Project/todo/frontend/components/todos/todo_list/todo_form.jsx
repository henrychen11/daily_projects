import React from 'react';


class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      id: this.uniqueId(),
      title: "",
      body: "",
      done: false
    };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.updateTodo = this.updateTodo.bind(this);
  }

  updateTodo(event) {
    this.setState({title: event.target.value.title, body: event.target.value.body});
  }

  uniqueId() {
    return new Date().getTime();
  }

  handleSubmit(event) {
    event.preventDefault();
    // debugger;
    this.props.receiveTodo(this.state);
    this.setState({ title: "", body: ""});
  }

  render () {
    return (
      <div>

        <h2>New Todo Item</h2>
        <form onSubmit={this.handleSubmit}>
          <input
            type="text"
            onChange={this.updateTodo}
            value={this.state.title} >
            Title
          </input>

          <input
            type="text"
            onChange={this.updateTodo}
            value={this.state.body} >
          Body
          </input>


          <button>Add item</button>
        </form>

      </div>
    );
  }
}


export default TodoForm;
