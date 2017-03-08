import React from 'react';

class GiphyIndexItem extends React.Component {
  constructor(props) {
    super(props);
    this.props = props;
  }
  render() {
    return  <li className="giphy-li">
              <iframe src={this.props.url} width="480" height="360" frameBorder="0" allowFullScreen></iframe>
              <p>
                <a href="http://giphy.com/gifs/art-animation-2d-ic1cehERgA9gY">via GIPHY</a>
              </p>
            </li>;
  }
}

export default GiphyIndexItem;
