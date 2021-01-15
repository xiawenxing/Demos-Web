import React, { Component } from 'react';
import './App.css';
import { createMuiTheme } from '@material-ui/core/styles';
import { render } from '@testing-library/react';
import MyAppBar from './MyAppBar'
import HomePage from './HomePage'
import DeliciousDrinks from './DeliciousDrinks'
import BuyDrinkPage from './BuyDrinkPage'
import MoreInfoPage from './MoreInfoPage'
import CartListPage from './CartListPage'
import AboutUs from './AboutUs'
import {BrowserRouter as Router,
  Switch,
  Route,
  Link} from "react-router-dom"

const mainTheme = createMuiTheme({ 
  palette: {
    primary: {
      // light: 这将从 palette.primary.main 中进行计算，
      main: '#FFF6F6',
    },
}});
const highlightTheme = createMuiTheme({
  palette:{
    primary:{
      main:'#FD5353',
    }
  }
});

const textTheme = createMuiTheme({
  palette:{
    primary:{
      main:'#57423F',
    }
  }
});

class App extends Component {

  render(){
    return (
      <div className="App">
        <div className="App-header">
          <Router>
              <MyAppBar />
              <Switch>
                <Route path='/DeliciousDrinks' component={DeliciousDrinks} />
                <Route path='/AboutUs' component={AboutUs} />
                <Route path='/BuyDrinkPage/:drinkinfo' component={BuyDrinkPage} />
                <Route path='/MoreInfoPage' component={MoreInfoPage} />
                <Route path='/CartListPage' component={CartListPage} />
                <Route path='/' component={HomePage} />
              </Switch>
          </Router>
        </div>
        
      </div>
    );
  }
}

export default App;
