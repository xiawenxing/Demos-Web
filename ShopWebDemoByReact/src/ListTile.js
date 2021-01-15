import React,{Component,useState,useEffect} from 'react'
import {Button, ListItemAvatar, ListItem,Avatar,List, ListItemText,
    Divider,Paper,TextField,withStyles,
    ListItemSecondaryAction, Typography,Checkbox,FormControlLabel } from '@material-ui/core'
import './ListTile.css'
import ClearAlert from './ClearAlert'

const drinkspath = {'Ultricies bibendum':'../assets/Drinksl1.png',
    'Malesuada orci non':'../assets/Drinksl2.png',
    'Orci amet gravida':'../assets/Drinksl3.png',
    'Porttitor commodo vel':'../assets/Drinksl4.png',
    'Mattis sit':'../assets/Drinksl5.png',
    'Arcu tristique':'../assets/Drinksl6.png',
    'Sed nec':'../assets/Drinksl7.png',
    'Quisque lacinia sed':'../assets/Drinksl8.png'
};

const MyTextField = withStyles({
    root:{
        color: '#FD5353',
        backgroundColor: 'white',
        width:'80px',
    },
})(TextField);

function ListTile(props){
    const [quantity, setQuantity] = useState(props.quantity);
    const [disabled,setDisabled] = useState(true);
    const [error, setError] = useState(false);
    const [errText,setErrText] = useState("");
    const [cfmdis,setCfmdis] = useState(true);
    const [open,setOpen] = useState(false);
    // const shouldAlert = localStorage.hasOwnProperty('shouldAlert')?localStorage.getItem('shouldAlert'):'true';

    const handleTextChange = (event)=>{
        if(event.target.value<1)
        {
            setError(true);
            setErrText("Incorrect num");
            setCfmdis(true);
        }else{
            setError(false);
            setErrText("");
            setCfmdis(false);
        }
        setQuantity(event.target.value);
    }

    const handleModifyClick=()=>{
        setDisabled(false);
        setCfmdis(false);
    }

    const handleClearClick=()=>{
        setOpen(true);
    }

    const handleConfirmClick=()=>{
        props.handleConfirm(props.name,quantity);
        setCfmdis(true);
        setDisabled(true);
    }

    const handleClose = ()=>{
        setOpen(false);
    }

    const handleCheckChange = (event)=>{
        props.handleCheckChange(props.name,event);
    }

    return(
        <ListItem className='Cartlist-item'>

            <FormControlLabel 
                control={
                    <Checkbox style={{padding:'20px'}}
                        checked={props.checked}
                        onChange={handleCheckChange}
                    />
                } 
                label={
                    <div className='Cartlist-item'>
                    <ListItemAvatar>
                        <Avatar src={drinkspath[props.name]} style={{width:'80px',height:'80px'}} />
                    </ListItemAvatar>
                    <ListItemText primary={`${props.name}${" ₱"}${props.price}`} style={{padding:'30px'}} />
                    </div>
                }
            />

            <ListItemSecondaryAction className="Cartlist-item-action">
                        <MyTextField 
                                    className="Cartlist-item-quantity"
                                    type="number"
                                    defaultValue={props.quantity}
                                    InputProps={{readOnly:false}}
                                    InputLabelProps={{shrink:true}}
                                    variant="outlined" 
                                    onChange={handleTextChange}
                                    error={error}
                                    helperText={errText}
                                    disabled={disabled}
                                    />
                        <div className="Cartlist-item-buttons">
                                <Button onClick={handleClearClick}>clear</Button>
                                <Button onClick={handleModifyClick}>Modify</Button>
                                {disabled?null:<Button onClick={handleConfirmClick} disabled={cfmdis}>Confirm</Button>}
                                <ClearAlert open={open} 
                                    handleConfirm={props.handleClearClick} 
                                    name={props.name}
                                    handleClose={handleClose}
                                    />
                        </div>
            </ListItemSecondaryAction>

        </ListItem>

    );
}

export default ListTile;