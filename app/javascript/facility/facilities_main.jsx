import React from 'react';
import FacilityDetails from './facility_details.jsx';
import FacilityAddress from './facility_address.jsx';
import logo from "./logo.jpg";
import 'whatwg-fetch';
import { Router, Route, browserHistory } from 'react-router';


export default class Facilities extends React.Component {
  componentDidMount() {
    var fac_nbr = parseInt(this.props.params.fac_nbr)
       fetch(`/facilities/${fac_nbr}`, {
           mode: "no-cors",
           method: "GET",
           headers: {
               "Accept": "application/json"
           }
       })
       .then(
       response => response.json())
       .then((response) => {
           console.log(response);
           return this.setState({ items: response});

       })
       .catch(error => {
           console.log('request failed', error);
       });
   }
    render() {
        let propsData = this.props.location.state.data;
     //items.each do |item| <Link to facility/fac_nbr compononet facilities params = item>
        return (
            <div className="main_page">
                <div className="header_cwds col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <img src= {logo} alt = {"logo"} />
                </div>
                <div className="body_cwds col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <FacilityDetails facilityData={propsData} />
                    <FacilityAddress facilityData={propsData} />
                </div>
            </div>
        )
    }
};
