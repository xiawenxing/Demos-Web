import React,{Component} from 'react';
import { AppBar,Tabs,Tab,Toolbar,IconButton,Typography, Button, withStyles, Icon, SvgIcon } from '@material-ui/core';
import { createMuiTheme } from '@material-ui/core/styles'; 
import logo from './assets/logo.png';
import { ShoppingCart } from '@material-ui/icons'
import cookie from 'react-cookies';
import './MyAppBar.css'
import HomePage from './HomePage'
import DeliciousDrinks from './DeliciousDrinks'
import BuyDrinkPage from './BuyDrinkPage'
import {BrowserRouter as Router,
    Switch,
    Route,
    Link} from "react-router-dom"

const theme = createMuiTheme({ 
    palette: {
      primary: {
        // light: 这将从 palette.primary.main 中进行计算，
        main: '#FFF6F6',
      },
  }});

const MakeOrderButton = withStyles({
    root: {
        background:'#FD5353',
        color: '#FFF6F6',
    },
    variant:'contained',
  })(Button);

const MyTabs = withStyles({
    centered:true,
    root:{
        color:'#57423F',
    },
    indicator:{
        // color:'white',
        backgroundColor:'transparent',
    }
})(Tabs);

const MyTab = withStyles({
    selected:{
        color:'#FD5353',
    },
    wrapped:true,
})(Tab);


class MyAppBar extends Component{

    constructor(props){
        super(props);
        this.state = {
            value: 'Home' ,
        };
    }

    componentWillMount(){
        var index = cookie.load("tabIndex");
        if(index!=null)
            this.state.value=index;
    }

    handleTabChange(event,newValue){
        cookie.save("tabIndex",newValue,{path:"/"});
        this.setState({
            value:newValue
        });
    }


    renderTabs(){
        const value = this.state.value;
        return(
          <MyTabs value={value} onChange={this.handleTabChange.bind(this)}>
                <MyTab label='Home' href='/' value='Home' />
                <MyTab label='About Us' href='/AboutUs' value='About Us' />
                <MyTab label='Delicious Drinks' href='/DeliciousDrinks' value='Delicious Drinks' />
                <MyTab label='Our Team' value='Our Team' />
                <MyTab label='Privacy Policy' value='Privacy Policy' />
          </MyTabs>
        );
      }

    render(){
        return(
            <div className='MyAppBar'>
                <AppBar position="static" color='transparent' elevation={0}>
                    <Toolbar>
                        <div className="Toolbar-elements">
                            <div className="Logo-elements">
                                <IconButton >
                                    <img src={logo} /> 
                                </IconButton>
                                <Typography className="Logo-text">Concierge Co.</Typography>
                            </div>

                            <div className='Tabs'>{this.renderTabs()}</div>

                            <div className="Make-order-button" style={{display: 'inline-flex',alignItems: 'center'}}>
                                <Link to="/CartListPage"><ShoppingCart style={{color:'#FD5353', padding:'4px'}} /></Link>
                                <MakeOrderButton> Make an order</MakeOrderButton>
                            </div>
                        </div>
                    </Toolbar>
                </AppBar>   
            </div>
        );
    }
}

export default MyAppBar;