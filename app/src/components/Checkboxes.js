import React from 'react';
import { Checkbox } from 'antd';

class Checkboxes extends React.Component {
  
    constructor(props) {
        super(props);

        let box = [
            [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 , 1],
            [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 1],
            [ 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0 , 1],
            [ 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0 , 1],
            [ 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0 , 1],
            [ 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0 , 1],
            [ 1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 1, 0 , 1],
            [ 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0 , 1],
            [ 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0 , 1],
            [ 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0 , 1],
            [ 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0 , 1],
            [ 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 0 , 1],
            [ 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0 , 1],
            [ 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0 , 1],
            [ 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 1],
            [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 , 1],
        ]

        this.height = box.length;
        this.width = box.length;

        this.state = { area : box};
      }

    fill = (x, y, val) => {

        // console.log(x)
        // console.log(y)

        let temp = this.state.area.slice();
        if (x > -1 && y > -1 && x < this.width && y < this.height) {
            if (temp[x][y] === val ) {

                temp[x][y] = !val;
                this.setState({area : temp});
                window.setTimeout( () => {
                    this.fill(x, y + 1, val);
                    this.fill(x, y - 1, val);
                    this.fill(x - 1, y, val);
                    this.fill(x + 1, y, val);
                }, 0);
            }
            return;
        }
        
    }

    render() {            
        return (
            <div className="Checkboxes">
            {
                this.state.area.map( (box, x) => <div key={"box-" + x}>{box.map( (b, y) => <Checkbox onClick={() => this.fill(x,y,b)} key={"b-box-" + x + "-" + y} checked={b}/>)}</div>)
            }
            </div>
        );
    }
}

export {Checkboxes};
