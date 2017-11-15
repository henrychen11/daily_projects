

const allTodos = (state) => {
  let todosArray = [];

  Object.keys(state.todos).map ( (key) => {
    todosArray.push(state.todos[key]);
  });
  return todosArray;
};

export default allTodos;
