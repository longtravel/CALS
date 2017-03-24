import React, { Component } from 'react';

export default class Hello extends Component {

    constructor(props) {
        super(props);
        this.state = { liked: props.liked, title: props.title };
    }

    onClickLike() {
        this.setState({
            liked: !this.state.liked,
            title: this.state.title});
    }

    render() {
        return (
                <div>
                <h1>Hello {this.props.title}!</h1>
                <button onClick={() => this.onClickLike()}>
                {this.state.liked ? "liked" : "not liked" }
                </button>
                </div>
               );
    }
}
