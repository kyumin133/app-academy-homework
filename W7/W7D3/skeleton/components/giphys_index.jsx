import React from 'react';
import GiphyIndexItem from './giphy_index_item'

class GiphysIndex extends React.Component {
  constructor(props) {
    super(props);
    this.props = props;
  }
  render() {
    let itemArr = [];
    if (this.props.giphys !== undefined) {
      for (let i = 0; i < this.props.giphys.length; i++) {
        itemArr.push(<GiphyIndexItem key={i} url={this.props.giphys[i].embed_url} />);
      }
    }
    // console.log(itemArr);
    return  <div>
              <ul>{itemArr}</ul>
            </div>;
  }
}

export default GiphysIndex;
