import React,{Component} from 'react'
import './BuyDrinkPage.css'

class BuyDrinkPage extends Component{
    render(){
        const info = JSON.parse(this.props.match.params.drinkinfo);
        // const info={name:'xxx'};
        return(
            <div>
                <p>
                You want to buy {info.name}.
                </p>
                <p>
                The Price is ₱{info.price}, please confirm your order information.
                </p>
            </div>
        );
    }
}

export default BuyDrinkPage;