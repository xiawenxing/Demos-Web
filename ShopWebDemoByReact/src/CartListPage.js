import React,{Component,useState,useEffect} from 'react'
import {Button, ListItemAvatar, ListItem,Avatar,List, ListItemText,
    Divider,Paper,TextField,withStyles,
    ListItemSecondaryAction, Typography,Checkbox,FormControlLabel } from '@material-ui/core'
import './CartListPage.css'
import ClearAlert from './ClearAlert'
import ListTile from './ListTile'

const drinkspath = {'Ultricies bibendum':'../assets/Drinksl1.png',
    'Malesuada orci non':'../assets/Drinksl2.png',
    'Orci amet gravida':'../assets/Drinksl3.png',
    'Porttitor commodo vel':'../assets/Drinksl4.png',
    'Mattis sit':'../assets/Drinksl5.png',
    'Arcu tristique':'../assets/Drinksl6.png',
    'Sed nec':'../assets/Drinksl7.png',
    'Quisque lacinia sed':'../assets/Drinksl8.png'
};

const drinkprice = {
    'Ultricies bibendum':150,
    'Malesuada orci non':200,
    'Orci amet gravida':80,
    'Porttitor commodo vel':120,
    'Mattis sit':150,
    'Arcu tristique':160,
    'Sed nec':100,
    'Quisque lacinia sed':250
}

const MyTextField = withStyles({
    root:{
        color: '#FD5353',
        backgroundColor: 'white',
        width:'80px',
    },
})(TextField);

class CartListpage extends Component{
    constructor(props){
        super(props);
        this.state={
            cartlist:{},
            cartlistArray:[],
            selectAllChecked:false,
            open:false,
            namelist:[]
        };
    }

    componentWillMount(){
        let array=[];
        let list={};
        if(localStorage.hasOwnProperty('cartlist'))
            list = JSON.parse(localStorage.getItem('cartlist'));
        for(var key in list){
            if(list[key]>0)
            array.push({
                name:key,
                quantity:list[key],
                price:drinkprice[key],
                checked:false
            }
            );
        }
        this.setState({
            cartlist:list,
            cartlistArray:array
        });
    }

    handleClearClick(name){
        let {cartlist,cartlistArray,namelist} = this.state;
        cartlist[name] = 0;
        cartlistArray.splice(cartlistArray.findIndex((item)=>item.name==name),1);
        namelist.splice(namelist.indexOf(name),1);
        localStorage.setItem('cartlist',JSON.stringify(cartlist));
        this.setState({
            cartlist: cartlist,
            cartlistArray: cartlistArray
        });
    }

    handleConfirm(name,newquantity){
        const {cartlist,cartlistArray} = this.state;
        let index = cartlistArray.findIndex((item)=>item.name==name);
        cartlist[name]= newquantity;
        localStorage.setItem('cartlist',JSON.stringify(cartlist));
        // if(newquantity<1)cartlistArray.splice(index,1);
        // else 
        cartlistArray[index]["quantity"] = newquantity;
        this.setState({
            cartlist:cartlist,
            cartlistArray:cartlistArray,
        });
    }

    handleCheckChange(name,event){
        let {cartlistArray,namelist} = this.state;
        let index = cartlistArray.findIndex((item)=>item.name==name);
        cartlistArray[index].checked = event.target.checked;
        if(cartlistArray[index].checked==true){
            if(namelist.indexOf(name)==-1)
                namelist.push(name);
        }else{
            if(namelist.indexOf(name)!=-1)
                namelist.splice(namelist.indexOf(name),1);
        }
        this.setState({cartlistArray:cartlistArray,namelist:namelist});
    }

    handleSelectAll(event){
        let {cartlistArray,namelist} = this.state;
        cartlistArray.forEach((item)=>{
            item.checked=event.target.checked;
            if(item.checked==true){
                if(namelist.indexOf(item.name)==-1)
                    namelist.push(item.name);
            }else{
                if(namelist.indexOf(item.name)!=-1)
                    namelist.splice(namelist.indexOf(item.name),1);
            }
        });
        this.setState({
            cartlistArray:cartlistArray,
            selectAllChecked:event.target.checked,
            namelist:namelist
        });
    }

    ClearSelected(){
        this.setState({
            open:true
        });
    }

    handleConfirmClearSelected(namelist){
        let {cartlist,cartlistArray} = this.state;
        let [...list] = namelist;
        list.forEach((name)=>{
            cartlist[name] = 0;
            cartlistArray.splice(cartlistArray.findIndex((item)=>item.name==name),1);
            namelist.splice(namelist.indexOf(name),1);
        });
        localStorage.setItem('cartlist',JSON.stringify(cartlist));
        this.setState({
            cartlist: cartlist,
            cartlistArray: cartlistArray
        });
    }

    handleCloseAlert(){
        this.setState({
            open:false
        });
    }

    render(){
        const {cartlist,cartlistArray,disabled,namelist} = this.state;
        return(
            <div>
                <div>
                {/* {JSON.stringify(cartlist)} */}
                {/* {JSON.stringify(this.state.namelist)} */}
                {/* <Button onClick={this.handleClearClick.bind(this)}>clear</Button>
                <Button onClick={this.handleModifyClick.bind(this)}>Modify</Button> */}
                {/* <Button className="Confirm-button" onClick={this.handleConfirm.bind(this)}
                 disabled={disabled} style={{disabled:{color:'black'}}}>Confirm</Button> */}
                </div>
                <Paper className="Cartlist-paper" style={{backgroundColor:'transparent'}}>
                {   cartlistArray.length==0?<Typography >Your cart is Empty...click here to find something you like...</Typography>
                    :
                    <List>
                        {cartlistArray.map((value)=>{
                            return(<div>
                                <ListTile name={value.name} quantity={value.quantity} price={value.price} checked={value.checked}
                                    handleClearClick={this.handleClearClick.bind(this)} 
                                    handleConfirm={this.handleConfirm.bind(this)}
                                    handleCheckChange={this.handleCheckChange.bind(this)}
                                />
                                { value.name==cartlistArray[cartlistArray.length-1].name?null:<Divider />}
                                </div>
                            );
                        })}
                    </List>    
                }
                </Paper>
                <div style={{paddingBottom:'100px'}}>
                    <FormControlLabel
                    control={
                        <Checkbox onChange={this.handleSelectAll.bind(this)} checked={this.state.selectAllChecked} />}
                    label={this.state.selectAllChecked?"Unselect All":"Select All"}
                    />
                    <Button onClick={this.ClearSelected.bind(this)}>Clear</Button>
                    <Button onClick={this.handleMakeOrder}>Make an Order</Button>
                    <ClearAlert open={this.state.open}
                        name={namelist}
                        handleClose={this.handleCloseAlert.bind(this)} 
                        handleConfirm={this.handleConfirmClearSelected.bind(this)}/>
                </div>
            </div>
        );
    }

}

export default CartListpage;