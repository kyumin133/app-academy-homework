import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.props = props;
    this.state = {
      searchTerm: ""
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(e) {
    this.setState({searchTerm: e.currentTarget.value});
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.fetchSearchGiphys(this.state.searchTerm);
    // this.forceUpdate();
  }

  render() {
    return  <div>
              <form>
                <input type="text" onChange={this.handleChange}></input>
                <input type="submit" onClick={this.handleSubmit} value="Submit"></input>
              </form>
              <GiphysIndex giphys={this.props.giphys.giphys}/>
            </div>;
  }
}

export default GiphysSearch;
