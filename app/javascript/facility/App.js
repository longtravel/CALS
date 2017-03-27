import React from 'react';
import 'whatwg-fetch';
import FacilityList from './facility_list.jsx';

export default class App extends React.Component {
  constructor() {
    super();
    this.state = {items: []};
  }
  componentDidMount() {
    fetch('/facilities', {
      mode: 'no-cors',
      method: 'GET',
      headers: {
        Accept: 'application/json',
      },
    })
    .then(
      response => response.json())
      .then((response) => {
        return this.setState({ items: response});

      })
      .catch(error => {
      });
    }
    render() {
      const itemsList = this.state.items.map(item => <FacilityList key={item.fac_nbr} {...item} />);
      return (
        <div className="block">
        {itemsList}
        </div>
      );
    }
  }
