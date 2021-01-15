import React,{Component} from 'react';
import { Card,CardMedia,Container,withStyles,MobileStepper, CardActions, CardActionArea, CardContent,Typography,Link } from '@material-ui/core';
import pic from './assets/Drinksw3.png'
import './HomePage.css'

const PicCard = withStyles({
    root:{
       backgroundColor : 'transparent',
       width: '100%',
       display: 'flex',
       flexDirection: 'column',
       justifyContent: 'flex-start',
       alignItems: 'center',
    },
})(Container);

const MyStepper = withStyles({
    root:{
        backgroundColor:'transparent',
        color:'#FD5353'
    },
    // color:'#FD5353',
})(MobileStepper);

class HomePage extends Component{
    
    render(){

        return(
            <div className='HomePage-items'>
                <div className='Pictures-items'>
                    <PicCard width='100%'> 
                        <CardMedia component='img' image={pic} className='Card-picture' />
                        <CardActions>
                            <MyStepper position='static' variant='dots' steps={3} />
                        </CardActions>
                    </PicCard>
                </div>
                <div className='Describe-items'>
                    <Typography className='Describe-title' variant='h4' >Green Apple Juice</Typography>
                    <Typography className='Describe-content'><p>Aenean sed nibh a magna posuere tempor. Nunc faucibus pellentesque nunc in aliquet. Donec congue, nunc vel tempor congue, enim sapien lobortis ipsum, in volutpat sem ex in ligula. Nunc purus est, consequat condimentum faucibus sed, iaculis sit amet massa.
                        </p>
                    </Typography>
                    <Typography className='Describe-link'>
                        <p><Link href='/MoreInfoPage' underline="always" style={{color:'inherit'}}>Learn more</Link></p>
                    </Typography>
                    
                </div>      
            </div>
        );    
    }
}

export default HomePage;