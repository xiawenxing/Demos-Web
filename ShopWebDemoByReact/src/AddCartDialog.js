import React,{Component, useEffect, useState} from 'react';
import './AddCartDialog.css'
import {Dialog,Typography,TextField,withStyles,Card, CardContent, CardActionArea, CardActions,Button, Checkbox, FormGroup,FormControlLabel } from '@material-ui/core'

const MyTextField = withStyles({
    root:{
        color: '#FD5353',
        backgroundColor: 'white',
        width:'80px',
    },
})(TextField);

const ConfirmButton = withStyles({
    root: {
        color: '#FD5353',
    },
  })(Button);

const CancelButton = withStyles({
    root:{
        color:'#57423F',
    },
})(Button);

function AddCartDialog(props){
    const [quantity, setQuantity] = useState(1);
    const [cnfrmDis, setCnfrmDis] = useState(false);
    const [error, setError] = useState(false);
    const [errText,seterrText] = useState("");
    const cartlist = localStorage.hasOwnProperty('cartlist')?JSON.parse(localStorage.getItem('cartlist')):{};
    const [checked, setChecked] = useState((localStorage.getItem('notShowAlert')=='true')?true:false);

    const handleTextChange = (event)=>{
        if(event.target.value<1)
        {
            setCnfrmDis(true);
            setError(true);
            seterrText("Incorrect num");
        }else{
            setCnfrmDis(false);
            setError(false);
            seterrText("");
        }
        
        setQuantity(event.target.value);
    }

    const handleConfirm = ()=>{
        if(cartlist[props.name]==null)cartlist[props.name]=0;
        cartlist[props.name]= parseInt(quantity)+parseInt(cartlist[props.name]);
        localStorage.setItem('cartlist',JSON.stringify(cartlist));
        if(!checked)alert("You have add "+quantity+" "+props.name+"s to your cart, you can check your cart by click the icon right on the navigator bar.");
        props.handleClose();
    }

    const handleCheckChange=(event)=>{
        let checkedNew = event.target.checked;
        localStorage.setItem('notShowAlert',checkedNew?'true':'false');
        setChecked(checkedNew);
    }

    useEffect(()=>{
        setChecked((localStorage.getItem('notShowAlert')=='true')?true:false);
    });

    return (
        <div>
            <Dialog open={props.open} onClose={props.handleClose}>
                <Card className="Add-cart-card" style={{backgroundColor:'#FFF6F6', color:'#57423F'}}>
                    <CardContent>
                        <Typography className="Add-cart-title" variant='h6'>Add to Cart</Typography>
                        <Typography className="Add-cart-content"><p>You want to add {props.name}</p></Typography>
                        <div style={{display:'flex',flexDirection:'column',alignItems:'center'}}> 
                        <MyTextField 
                            type="number"
                            defaultValue={1}
                            InputProps={{readOnly:false}}
                            InputLabelProps={{shrink:true}}
                            variant="outlined" 
                            onChange={handleTextChange}
                            error={error}
                            helperText={errText}
                            />
                        </div>
                        <Typography className="Add-cart-content">to cart. </Typography>
                        <FormGroup row>
                        <FormControlLabel 
                            control={<Checkbox checked={checked} onChange={handleCheckChange} />}
                            label="Donnot show alert again and remember my choice." />
                        </FormGroup>
                    </CardContent>
                        <CardActions className="Add-cart-buttons">
                            <CancelButton onClick={props.handleClose}>Cancel</CancelButton>
                            <ConfirmButton onClick={handleConfirm} disabled={cnfrmDis}>Confirm</ConfirmButton>
                        </CardActions>
                </Card>
            </Dialog>
        </div>
    );
}

export default AddCartDialog;