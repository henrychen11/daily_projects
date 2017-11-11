import React from 'react';

class Clock extends React.Component {
  constructor() {
    super();
    this.state = {
      time: new Date()
    };
  }

  tick() {
    this.setState({ time: new Date() });
  }

  componentDidMount() {
    this.intervalId = setInterval(this.tick.bind(this), 1000);
  }

  // componentWillUnmount(){
  //   clearInterval(this.intervalId);
  // }

  render(){
    return (
      <div className="clock">
        <h1>{this.state.time.toTimeString()}</h1>
        <h1>{this.state.time.toDateString()}</h1>
      </div>
    );
  }

}

export default Clock;
