using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace candyshop
{
    class defaultimages {
        string[] imageurl;

        public int ImgNum {
            get{
                return imageurl.Length;
            }
            set{}
        }

        public defaultimages() {
            imageurl = new string[5];
            imageurl[0] = "images/assortment-bright-candy-1043519.jpg";
            imageurl[1] = "images/bright-candy-chewy-1328885.jpg";
            imageurl[2] = "images/candies-colorful-colourful-1906435.jpg";
            imageurl[3] = "images/background-baked-bakery-1407346.jpg";
            imageurl[4] = "images/baked-bakery-baking-1376105.jpg";
        }

        public string getImage(int index) {
            return imageurl[index];

        }
    }
    public partial class _Default : Page
    {
        defaultimages dfimages = new defaultimages();
        protected void Page_Load(object sender, EventArgs e)
        {
            int index = 0;
            if (Request.Cookies["imageindex"]==null)
            {
                dfimages = new defaultimages();
                HttpCookie cookie = new HttpCookie("imageindex");
                cookie.Value = "0";
                cookie.Expires = DateTime.Now.AddDays(5);
                Response.Cookies.Add(cookie);
            }
            else
            {
                index = int.Parse(Request.Cookies["imageindex"].Value);
            }
            ImageMap1.ImageUrl = dfimages.getImage(index);
        }

        protected void ImageMap1_Click(object sender, ImageMapEventArgs e)
        {

        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            int index=0;
            // right button 
            if (Request.Cookies["imageindex"] == null)
            {
                dfimages = new defaultimages();
                HttpCookie cookie = new HttpCookie("imageindex");
                cookie.Value = "0";
                cookie.Expires = DateTime.Now.AddDays(5);
                Response.Cookies.Add(cookie);
            }
            else
            {

                index = int.Parse(Request.Cookies["imageindex"].Value);
                index++;
                index %= dfimages.ImgNum;
                HttpCookie cookie = new HttpCookie("imageindex");
                cookie.Value = index.ToString();
                cookie.Expires = DateTime.Now.AddDays(5);
                Response.Cookies.Add(cookie);
            }

                ImageMap1.ImageUrl = dfimages.getImage(index);
            
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            // left button 
            int index=0;
            if (Request.Cookies["imageindex"] == null)
            {
                dfimages = new defaultimages();
                HttpCookie cookie = new HttpCookie("imageindex");
                cookie.Value = "0";
                cookie.Expires = DateTime.Now.AddDays(5);
                Response.Cookies.Add(cookie);
            }
            else
            {

                index = int.Parse(Request.Cookies["imageindex"].Value);
                index += dfimages.ImgNum - 1;
                index %= dfimages.ImgNum;
                HttpCookie cookie = new HttpCookie("imageindex");
                cookie.Value = index.ToString();
                cookie.Expires = DateTime.Now.AddDays(5);
                Response.Cookies.Add(cookie);
            }

            ImageMap1.ImageUrl = dfimages.getImage(index);
        }
    }
}