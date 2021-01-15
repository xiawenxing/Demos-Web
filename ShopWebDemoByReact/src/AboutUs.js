import React,{Component} from 'react';
import pic from './assets/_company.png'
import {Typography,withStyles,Container,Card,CardMedia,Link} from '@material-ui/core';
import './AboutUs.css'

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

class AboutUs extends Component{
    render(){
        return(
            <div className='AboutUs-items'>
                <div className='Describe-items'>
                    <Typography className='Describe-title' variant='h4' >Concierge Co.</Typography>
                    <Typography className='Describe-content'><p>Aenean sed nibh a magna posuere tempor. Nunc faucibus pellentesque nunc in aliquet. Donec congue, nunc vel tempor congue, enim sapien lobortis ipsum, in volutpat sem ex in ligula. Nunc purus est, consequat condimentum faucibus sed, iaculis sit amet massa.
                        </p>
                    </Typography>
                    <Typography className='Describe-link'><p>
                        <Link href='/MoreInfoPage' underline="always" style={{color:'inherit'}}>Learn more</Link></p>
                    </Typography>
                
                </div>  
                <div className='Pictures-items'>
                    <PicCard width='100%'> 
                        <CardMedia component='img' image={pic} className='Card-picture' />
                    </PicCard>
                </div>    
            </div>
        );
    }
}

export default AboutUs;