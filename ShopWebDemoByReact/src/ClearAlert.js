import React,{Component} from 'react'
import {Dialog, DialogTitle, DialogContent, DialogContentText, DialogActions, Button} from '@material-ui/core'
import './ClearAlert.css'


function ClearAlert(props){

    const handleConfirm=()=>{
        props.handleConfirm(props.name);
        props.handleClose();
    }

    return(
        <Dialog open={props.open} onClose={props.handleClose}>
            <DialogTitle>{"Sure to Clear?"}</DialogTitle>
            <DialogContent>
                <DialogContentText>
                Clear will remove all this kind of product out of your cart. Please be careful.
                </DialogContentText>
            </DialogContent>
            <DialogActions>
                <Button onClick={props.handleClose}>Cancel</Button>
                <Button onClick={handleConfirm}>Confirm</Button>
            </DialogActions>
        </Dialog>
    );
}

export default ClearAlert;