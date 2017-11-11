import React from 'react';

class Tabs extends React.Component {
  constructor(props) {
    super(props); //merge inherited props with super props
    this.state = {
      tab_idx: 0
    };
    this.setOpenTab = this.setOpenTab.bind(this);
  }

  setOpenTab(idx=1) {
    debugger
    console.log(this.state.tab_idx);
    this.setState({ tab_idx: idx});
  }

  render() {
    return (
    <section className="tab">
      <ul>
        <h1 data-idx={0} onClick={this.setOpenTab

            }>Tab1</h1>
        <h1 data-idx={1} onClick={this.setOpenTab}>Tab2</h1>
        <h1 data-idx={2} onClick={this.setOpenTab}>Tab3</h1>
        <article>{this.props.sentences[this.state.tab_idx].content}</article>
      </ul>
    </section>
  );
}
}

export default Tabs;
