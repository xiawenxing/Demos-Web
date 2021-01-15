import React,{Component} from 'react';
import {Typography,Container,Card, CardMedia,CardContent, CardActions,Button,IconButton,Tooltip,
         Fade, withStyles} from '@material-ui/core';
import BuyDrinkPage from './BuyDrinkPage';
import {Route} from 'react-router-dom';
import AddCartDialog from './AddCartDialog';
import './DeliciousDrinks.css';
import {Add,AddBox} from '@material-ui/icons';
import dr1 from './assets/Drinksl1.png';
import dr2 from './assets/Drinksl2.png';
import dr3 from './assets/Drinksl3.png';
import dr4 from './assets/Drinksl4.png';
import dr5 from './assets/Drinksl5.png';
import dr6 from './assets/Drinksl6.png';
import dr7 from './assets/Drinksl7.png';
import dr8 from './assets/Drinksl8.png';

const drinks = [{
    pic:dr1,
    name:'Ultricies bibendum',
    price:'150.00'
},{
    pic:dr2,
    name:'Malesuada orci non',
    price:'200.00'
},{
    pic:dr3,
    name:'Orci amet gravida',
    price:'80.00'
},{
    pic:dr4,
    name:'Porttitor commodo vel',
    price:'120.00'
},{
    pic:dr5,
    name:'Mattis sit',
    price:'150.00'
},{
    pic:dr6,
    name:'Arcu tristique',
    price:'160.00'
},{
    pic:dr7,
    name:'Sed nec',
    price:'100.00'
},{
    pic:dr8,
    name:'Quisque lacinia sed',
    price:'250.00'
}
];


const ColoredTooltip = withStyles({
    arrow:{
        color:'rgb(253,83,83,0.2)'
    },
    tooltip:{
        backgroundColor:'rgb(253,83,83,0.2)',
        color:'rgb(253,83,83,1)',
        fontSize: 13
    },
})(Tooltip);


class DrinkCard extends Component{
    constructor(props){
        super(props);
        this.state = {
            openAddCartDialog:false
        };
    }

    openCartDialog(){
        this.setState(
            {
                openAddCartDialog:true
            }
        );
    }

    closeCartDialog(){
        this.setState(
            {
                openAddCartDialog:false
            }
        );
    }

    // this.props = {pic, name, price}
    render(){
        const drinkinfo = {
            // pic : this.props.pic,
            name : this.props.name,
            price : this.props.price
        }
        var infojson = JSON.stringify(drinkinfo);
        var path = `/BuyDrinkPage/${infojson}`;

        return(
            <Container className='Drink-card' style={{backgroundColor:'transparent'}}>
                <CardMedia component='img' image={this.props.pic} />
                <CardContent>
                    <Typography className='Drink-name'>
                        {drinkinfo.name}
                    </Typography>
                    <Typography className='Drink-price'>
                        ₱{drinkinfo.price}
                    </Typography>
                </CardContent>
                <CardActions className='Card-action-items'>
                    <Button style={{color:'white', backgroundColor:'#FD5353', width:'70%'}} href={path}>Buy</Button>
                    <ColoredTooltip title="add to cart" arrow TransitionComponent={Fade} TransitionProps={{timeout:600}}>
                        <Add style={{color:'#FD5353', backgroundColor:'rgb(253,83,83,0.2)'}} onClick={this.openCartDialog.bind(this)} />
                    </ColoredTooltip>
                    <AddCartDialog open={this.state.openAddCartDialog} handleClose={this.closeCartDialog.bind(this)} name={drinkinfo.name} />
                </CardActions>
            </Container>
        );
    }
}

class DeliciousDrinks extends Component{
    constructor(props){
        super(props);
        this.state = {drinklist:drinks};
        if(localStorage.hasOwnProperty('notShowAlert')==false)
            localStorage.setItem('notShowAlert','false');
    }

    componentWillMount(){
        // ajAx获取drinks列表（可以由后端从数据库中读取发送给前端）
    }

    render(){
        const drlist = this.state.drinklist;
        return(
         <div>
             <div className='DD-header'>
                <Typography className='DD-header-title' variant='h2'>Delicious Drinks</Typography>
                <Typography className='DD-header-content'>Phasellus finibus enim nulla, quis ornare odio facilisis eu. Suspendisse ornare ante sit amet arcu semper, vel eleifend tortor egestas..</Typography>
             </div>
             <div className='DD-gridview'>
                {drlist.map((drink)=>{
                    return(<DrinkCard pic={drink.pic} name={drink.name} price={drink.price} />);
                })}
             </div>
         </div>   
        );
    }
}

export default DeliciousDrinks;