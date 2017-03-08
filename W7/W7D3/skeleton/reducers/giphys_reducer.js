import merge from 'lodash/merge';
import { RECEIVE_SEARCH_GIPHYS } from '../actions/giphy_actions';


const GiphysReducer = (state = [], action) => {
  switch (action.type) {
    case RECEIVE_SEARCH_GIPHYS:
      let newState = merge({}, state);
      newState.giphys = action["giphys"];
      return newState;
      // return state;
    default:
      return state;
  }
};

export default GiphysReducer;
