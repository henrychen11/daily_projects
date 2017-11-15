import React from 'react';
import { uniqueId } from '../../../util/uniq';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: "",
      body: "",
      done: false
    };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.updateTodo = this.updateTodo.bind(this);
  }

  updateTodo(property) {
    return event => this.setState({[property]: event.target.value});
  }

  handleSubmit(event) {
    event.preventDefault();
    let todo = Object.assign({}, this.state, { id: uniqueId() });
    this.props.createTodo({todo}).then(
      () => this.setState({ title: "", body: ""})
    );
  }

  render () {
    let { errors } = this.props;
    return (
      <div>

        <h2>New Todo Item</h2>
        <form onSubmit={this.handleSubmit}>
          <label>Title
            <input
              type="text"
              onChange={this.updateTodo('title')}
              value={this.state.title} />
          </label>
        <br />
          <label> Body
            <input
              type="text"
              onChange={this.updateTodo('body')}
              value={this.state.body} />
          </label>

          <button>Add item</button>
        </form>

        <h3>Errors</h3>
        <ul>
          {
            errors.map ((error, index) => (
              <li key={index}>{error}</li>
            ))
          }
        </ul>

      </div>
    );
  }
}


export default TodoForm;
