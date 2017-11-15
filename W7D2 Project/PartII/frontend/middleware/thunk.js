
const thunk = ({ dispatch, getState }) => next => action => {
  if (typeof action === 'function') {
    return action(dispatch, getState);
  }
  //if action is an "Object" then middleware does nothing, pass it down to reducers
  return next(action);
};

export default thunk;
