<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<!-- Add this in your HTML head -->

  <link rel="stylesheet" href="style.css">
<style>

html, body {
  margin: 0;
  padding: 0;
  
}
.main-container {
  height: 750px;
  overflow: hidden; /* or 'auto' if you want scrollbars */
}

.nav-bar{
background-color:brown;
    position: sticky;
  top: 0;
  height: 75px;
  vertical-align: top;
  display: flex;
  align-items: center;
  padding: 0 10px;
  z-index: 10;
  font-family: Helvetica Neue;
  border-bottom:0.5px solid gray;
}
a{

    margin-right: 90px;
    text-decoration: none;
font-size: 11.5px;
  color: white;
  transition: all 0.2s ease;
  display: inline-block;
}

.offer{

    display: flex;
  flex-direction: column;
  margin-left: 100px;
}
.slider {
  margin-top: 20px;
    height: 600px; /* Or however tall you want the carousel */
    overflow: hidden;
}

.middle-nav{
    position: relative;
}
.right-nav{
display:flex;
gap: 35px; 
    margin-left: auto;
    flex-direction:row;
}
.img1{
    object-fit: cover;
    height: 750px;
}
.first-offer-container{
    display: flex;
    flex-direction: row;
    width:1100px;
    margin-top: 50px;
}
.left-offer{
    flex: 1;
}
.right-offer{
    flex: 1;
    margin-left: 40px;
}
img{
    object-fit: cover;
}
.second-offer-container{
    display: flex;
    flex-direction: row;

    width:1100px;
}
.why-choose-us {
  padding: 50px 20px;
  background-color: white;
  text-align: center;
}

.why-choose-us h2 {
  font-size: 32px;
  margin-bottom: 40px;
  font-family: 'Arial', sans-serif;
}

.reasons {
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
  gap: 30px;
}

.reason-card {
  width: 250px;
  padding: 20px;
  background-color: white;
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0,0,0,0.1);
  transition: transform 0.3s ease;
}

.reason-card:hover {
  transform: scale(1.1);
}

.reason-card img {
  width: 60px;
  height: 60px;
  margin-bottom: 15px;
}

.reason-card h3 {
  margin-bottom: 10px;
  font-size: 20px;
  color: #333;
}

.reason-card p {
  font-size: 14px;
  color: #666;
}
.footer {

  position: relative;
      overflow: hidden;
      z-index: 9;
  background-color: #8c7763;
  color: #fff;
  padding: 50px 40px 30px;
  font-family: 'Segoe UI', sans-serif;
}




.icons a {
  margin: 0 8px;
  font-size: 18px;
  color: white;
  transition: 0.3s ease;
}

.icons a:hover {
  color: #d4c3b5;
}

/* Responsive Design */

 

.about-preview {
height: 400px;
  background-image: url("${pageContext.request.contextPath}/resource/images/system/about-app.png");
  background-size: cover;
  padding: 80px 20px;
  text-align: center;
  margin-bottom: 20px;
}

.about-content {
  max-width: 650px;
}

.about-content h2 {
  font-size: 32px;
  color: #6f4e37;
  margin-left: 30px;
  margin-top: 150px;
  margin-bottom: 40px;
}

.about-content p {
  margin-left: 60px;
  width: 550px;
  font-size: 18px;
  color: #555;
  margin-bottom: 30px;
  line-height: 1.6;
  text-align: center;
}

.about-button {
  margin-left: 100px;
  padding: 12px 25px;
  background-color: #6f4e37;
  color: white;
  border-radius: 30px;
  text-decoration: none;
  font-weight: bold;
  transition: background-color 0.3s ease;
}




.carousel-container {
    top: 60px; /* if your nav-bar is 60px high */
    left: 0;
    width: 2700;
    height: 700px;
    z-index: 5;
    transition: opacity 0.5s ease, transform 0.5s ease;
  }
  .carousel-container.hidden {
    opacity: 0;
    transform: translateY(-100%);
    pointer-events: none;
  }
  



.carousel-images {
    display: flex;
    width: 2800px;
    height: 600px;
    transition: transform 0.5s ease;
}
.carousel-images img{
    flex:1;
    object-fit: cover;
    flex-shrink: 0;
}
  
.logo1{
width:100px;
flex:1;
}
.search{
flex:1;
}
.search input{
width:200px;
height:15px;
padding: 8px;
  font-size: 12px;
  border-radius:25px;
   padding-left: 35px;
}
.cart{
flex:1;}


@keyframes slide {
    0% { transform: translateX(0); }
    33% { transform: translateX(-100%); }
    100% { transform: translateX(0); }
}

.carousel {
    animation: slide 9s infinite;
}

.carousel-caption {
    position: absolute;
    top: 30%;
    left: 10%;
    transform: translateY(-50%);
    color: white;
    text-align: left;
    z-index: 5;
  }
  
  .carousel-caption h2 {
    font-size: 48px;
    margin: 0;
    font-family: Proxima Nova;
  }
  
  .carousel-caption p {
    font-size: 20px;
    margin: 10px 0;
    font-family: Avenir;
  }
  
  .shop-now {
    padding: 12px 24px;
    background-color: #6f4e37;
    color: white;
    text-decoration: none;
    border-radius: 30px;
    font-weight: bold;
    display: inline-block;
    margin-top: 10px;
  }
  
  .shop-now:hover {
    background-color: #593f2c;
  }
  
  .footer {
    background-image: url("${pageContext.request.contextPath}/resource/images/system/1745258774326.jpg");
    height: 490px;
    color: white;
    padding: 40px 20px 20px;
  }
  
  .footer-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    margin-bottom: 60px;
  }
  
  .footer-section {
    flex: 1 1 200px;
    margin: 10px;
  }
  
  .footer-section h4 {
    font-size: 20px;
    margin-bottom: 30px;
    font-family: Cormorant, serif;
    font-weight: lighter;
  }
  
  .footer-section ul {
    list-style: none;
    padding: 0;
  }
  
  .footer-section ul li a {
    color: white;
    text-decoration: none;
    font-size: 14px;

    font-family: Lato, sans-serif;
    font-weight: 10;
    
  }
  
  .footer-section ul li {

    margin-top: 18px;
  }
  
  .brand h2 {
    font-size: 22px;
    margin-bottom: 20px;
  }
  
  .footer-bottom {
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    border-top: 1px solid #fff;
    padding-top: 20px;
    margin-top: 20px;
  }
  .footer-section-brand{
margin-top: 50px;
margin-right: 100px;
margin-left: 50px;
  }

  
  .social-icons img {
    margin-top: 60px;
    width: 35px;
  }
  .social-icons a {
    margin: 0 14px; /* Adjusted spacing */
    display: inline-block; /* Ensures proper alignment */
  }
  
   /* .email-section {
    width: 30%;
    text-align: center;
}
 .email-section input {

  background-color: transparent; 
  border-top:  solid 1px white;
  border-bottom:  solid 1px white;
  border-left:  solid 1px white;
    padding: 10px;
    width: 70%;
    margin-right: 10px;
}
 .email-section button {
    padding: 10px 20px;
    background-color: transparent; 
    background-color: transparent; 
    border-top:  solid 1px white;
    border-bottom:  solid 1px white;
    border-left:  solid 1px white;
    color: #fff;
    cursor: pointer;
} */

.email-container {
  font-family: Cormorant, serif;
  flex:1;
  display: flex;
  border: 1px solid #ccc; /* Shared border */
  overflow: hidden; /* Ensures rounded corners apply to all contents */
  width: 410px;
}

 .email-section input {
  padding: 10px;
  width: 280px;
  height: 20px;
  border: none; /* No individual border */
  background-color: transparent; /* Transparent background */
  color: #f5f5f5; /* Text color */
  outline: none; /* Remove focus outline */
}

 .email-section button {
  height: 30px;
  margin:5px;
  width: 20px;
  background-color: #444;
  color: #fff;
  border: none; /* No individual border */
  cursor: pointer;
  padding-left: 30px;
  border-left: 2px solid #ccc; /* Separator between input and button */
}
.social-media{
  position: absolute;
  right: 20px;
  flex:1;
}
.footer-bottom-section{
  display: flex;
  flex-direction: row;
  margin-top: 20px;
}
.social-media p{
  font-size: 20px;
  font-family: Cormorant, serif;
  position: absolute;
  margin-right: 20px;
  right: 30px;
}
.col{
  text-align: right;
}
.horizontal-line{
  width: 50px;
  height: 2px;
  position:absolute;
background-color: black;
margin-left: 40px;
}





.about-button:hover {
  background-color: #593f2c;
}
.feature{
  background-color: white;
  display: flex;
  flex-direction: row;
  padding-bottom: 100px;
}
.first-section{
  flex: 1;
  margin-left: 60px;
  margin-right: 90px;
}
.second-section{
  flex:1;
}
.third-section{
  flex:1;
}
.feature-topic{
  color: rgb(164, 93, 63);
  font-family: Alegreya, serif;
  font-size: 20px;
}
.first-row{
  margin-top: 90px;
}
.second-row{
  margin-top: 70px;
}
.description{
  line-height: 24px;
  font-weight: 290;
  color: gray;
  font-family: Helvetica Neue;
  text-align: right;
}
.most-popular {
      width: 100%;
      max-width: 1600px;
      overflow: hidden;
      background-color: rgb(187, 182, 176);
    }

    .scroll-container {
      display: flex;
      overflow-x: auto;
      scroll-behavior: smooth;
    }

    .scroll-container img {
      width: 400px;
      height: 400px;
      margin-right: 10px;
    }
    .recommended-for-you, .newest-arrival{
      position: relative;
      overflow: hidden;
      z-index: 9;
      background-color: #e2dcd7;
      padding-bottom: 20px;
      padding-top: 50px;
      margin-bottom: 40px;
    }
   

.recommended-for-you h2, .newest-arrival h2{
  font-weight: 500;
  font-size: 30px;
  letter-spacing: 2px;
  margin-left: 40px;
  font-family: Poppins, sans-serif;
}

.products {
  
  margin-top: 80px;
  display: flex;
  justify-content: center;
  gap: 40px;
  flex-wrap: wrap;
}

.product {
 /*  border: 0.1px solid gray; */
  padding: 20px;
  position: relative;
  width: 200px;
}

.product img {
  width: 100%;
  height: auto;
  margin-bottom: 10px;
}
.description1{
  color: gray;
  font-family: Helvetica Neue;
  text-align: left;
  line-height: 24px;
  font-weight: 290;
}

.product h3 {
  font-size: 20px;
  font-weight: 300;
}
.product p{
margin-top: 0px;
font-size: 15px;
}
.price {
  font-size: 0.9rem;
  color: #333;
}
.nav-bar a:hover{
color:white;
  text-decoration: underline;
  text-underline-offset: 4px;
  font-weight: 600;
  transform: translateX(1px);
}
.nav-bar a:active{
  color: gray;
  width: 30px;
}
.old-price {
  text-decoration: line-through;
  font-weight: lighter;
  color: #aaa;
  margin-right: 5px;
}

.tag {
  position: absolute;
  top: 10px;
  left: 10px;
  background-color: #f5dcdc;
  font-size: 0.7rem;
  font-weight: bold;
  padding: 3px 6px;
  letter-spacing: 1px;
  border-radius: 3px;
  text-transform: uppercase;
}

.tag.new {
  background-color: #f5dcdc;
}

.tag.sale {
  background-color: #f5dcdc;
}
.profile-container {
flex:1;
      position: relative;
      display: inline-block;
    }

    .profile-icon {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      background-color: #bbb;
      cursor: pointer;
      margin-right:20px;
    }

    .dropdown-frame {
      display: none;
      position: absolute;
      top: 50px;
      right: 0;
      width: 200px;
      background: white;
      border-radius: 8px;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
      z-index: 1000;
      padding: 15px;
    }

    .dropdown-frame p {
      margin: 5px 0;
      font-size: 14px;
    }

    .dropdown-frame button {
      width: 100%;
      margin-top: 10px;
      padding: 6px;
      border: none;
      background: #6c63ff;
      color: white;
      border-radius: 4px;
      cursor: pointer;
    }

    .dropdown-frame button:hover {
      background: #5751d9;
    }

    .slider-descrip1{
      margin-top: 60px;
      margin-left: 60px;
    }
    .logo1{
    margin-left:20px;
    }
    .icon{
    position:absolute;
    top:12px;
    right:429px;
    }
    .wishlist{
    margin-top:6px;}
    .cart{
    margin-top:5px;
    }
  </style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class=nav-bar>
    <div class="logo1">
    <img class="logo" src="${pageContext.request.contextPath}/resource/images/system/logo4.png" width="120px" height="44px">
</div>
<div class="middle-nav">
<a href="#"  class="hover-underline">HOME</a>
<a href="#">CONTACT US</a>
<a href="#">ABOUT US</a>
<a href="#">PORTIFIO</a>
</div>

<div class="right-nav">
<div class="search">
  <span class="icon"><img src="${pageContext.request.contextPath}/resource/images/system/search.png" width="45px" height="45px"></span>
<input type="text" placeholder="Search">
</div>
<div class="wishlist">
<img src="${pageContext.request.contextPath}/resource/images/system/wishlist.png" width="25px" height="25px">
</div>
<div class="cart">
<img src="${pageContext.request.contextPath}/resource/images/system/cart1.png" width="25px" height="25px">
</div> 

  <div class="profile-container">
    <div class="profile-icon" onclick="toggleDropdown()"></div>
    <div class="dropdown-frame" id="dropdown">
      <p><strong>John Doe</strong></p>
      <p>john@example.com</p>
      <button>View Profile</button>
      <button>Logout</button>
    </div>
  </div>
  
<!--   <script>
    function toggleDropdown() {
      const dropdown = document.getElementById("dropdown");
      dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
    }
  </script> -->
</div>
</div>
<section class="main-container">
  <div class="carousel-container">
    <div class="carousel">
        <div class="carousel-images">
          <div class="carousel-images">
            <div style="position: relative;">
              <img src="${pageContext.request.contextPath}/resource/images/system/slider1.png" alt="Banner 1" width="1425px" height="800px">
              <div class="carousel-caption">
                <h2>Shop Our Handmade Collection</h2>
                <p>Unique crafts made with love.</p>
                <a href="#" class="shop-now">Shop Now</a>
              </div>
              </div>
            </div>
            
              <div class="carousel-images">
                <div style="position: relative;">
            <img src="${pageContext.request.contextPath}/resource/images/system/slider3.png" alt="Banner 3"  width="1400px" height="800px">
            <div class="carousel-caption">
              <div class="slider-descrip1">
              <h2>Support Local Creators</h2>
            <p>Join the movement and empower small businesses with every purchase.</p>
            <a href="#" class="shop-now">About Us</a>
            </div>
          </div>
              </div>
              </div>
        </div>
    </div>
</div>
</section>
   <!-- <div class="second-offer-container">
    <div class="left-offer">
        <img src="image copy 3.png" width="600px"  height="350px"></div>
        <div class="right-offer">
            <img src="plate.png" width="600px"  height="350px"></div>
</div> -->
   

<section class="feature">
    <div class="first-section">
        <div class="feature-topic">
          <div class="first-row">
            <img src="${pageContext.request.contextPath}/resource/images/system/whyus1.png"width="50px" style="margin-left: 390px;">
            <div class="col">
          <p>UNIQUE</p>
        </div>
      </div>
        </div>
        <div class="description">
          <p>Every piece is one-of-a-kind, made to stand out. No two items are ever the same—your purchase is as distinctive as you are, with its own story and personality.</p>
    
        </div>
        <div class="feature-topic">
          <div class="second-row">
            <img src="${pageContext.request.contextPath}/resource/images/system/whyus2.png"width="50px" style="margin-left: 390px;">
            <div class="col">
              <p>TRADITIONAL</p>
              </div>
        </div>
        </div>
        <div class="description">
 <p>Crafted with age-old techniques passed down through generations. Each item preserves cultural heritage, celebrating the roots and rich history behind every creation.</p>
    
        </div>
    </div>
    <div class="second-section">
        <img src="${pageContext.request.contextPath}/resource/images/system/feature.png" width="350px" height="500px">
    </div>
    <div class="third-section">
      <div class="feature-topic">
        <div class="first-row">
          <img src="${pageContext.request.contextPath}/resource/images/system/whyus4.png"width="50px">
        <p>100% HANDMADE </p>
      </div>
      </div>
      <div class="description1">
        <p>Lovingly handcrafted, not machine-made. Each piece reflects the artisan’s heart and skill, offering a personal touch that no factory can replicate.</p>
    
      </div>
      <div class="feature-topic">
        <div class="second-row">
          <img src="${pageContext.request.contextPath}/resource/images/system/whyus3.png"width="50px">
        <p>SUPPORT LOCAL ARTISANS</p>
      </div>
      </div>
      <div class="description1">
        <p>Empowering local artisans with every purchase you make. You're not just buying a product—you’re investing in communities, families, and dreams.</p>
    
      </div>
    </div>
</section>

<section class="recommended-for-you">
    <h2>NEW </h2><h2>ARRIVALS</h2>
    <hr class="horizontal-line">
    <div class="products">
      <div class="product">
        <span class="tag new">NEW</span>
        <img src="${pageContext.request.contextPath}/resource/images/system/mostP.png" alt="Nordic Vase">
        <h3>NORDIC VASE</h3>
        <p class="price">$310</p>
      </div>
      <div class="product">
        <img src="${pageContext.request.contextPath}/resource/images/system/mostP4.png" alt="Sand Plate">
        <h3>SAND PLATE</h3>
        <p class="price">$250</p>
      </div>
      <div class="product">
        <span class="tag sale">SALE</span>
        <img src="${pageContext.request.contextPath}/resource/images/system/mostP2.png" alt="Pink Mug">
        <h3>PINK MUG</h3>
        <p class="price"><span class="old-price">$200</span> $170</p>
      </div>
      <div class="product">
        <img src="${pageContext.request.contextPath}/resource/images/system/image copy 4.png" alt="Indigo Plate">
        <h3>INDIGO PLATE</h3>
        <p class="price">$300</p>
      </div>
      <div class="product">
        <img src="${pageContext.request.contextPath}/resource/images/system/image copy 4.png" alt="Indigo Plate">
        <h3>INDIGO PLATE</h3>
        <p class="price">$300</p>
      </div>
      
    </div>
  </section>
  
  <section class="newest-arrival">
    <h2>RECOMMENDED </h2><h2>FOR YOU</h2>
    <hr class="horizontal-line">
      <div class="products">
        <div class="product">
          <img src="${pageContext.request.contextPath}/resource/images/system/mostP.png" alt="Nordic Vase">
          <h3>NORDIC VASE</h3>
          <p class="price">$310</p>
        </div>
        <div class="product">
          <img src="${pageContext.request.contextPath}/resource/images/system/mostP4.png" alt="Sand Plate">
          <h3>SAND PLATE</h3>
          <p class="price">$250</p>
        </div>
        <div class="product">
          <img src="${pageContext.request.contextPath}/resource/images/system/mostP2.png" alt="Pink Mug">
          <h3>PINK MUG</h3>
          <p class="price"><span class="old-price">$200</span> $170</p>
        </div>
        <div class="product">
          <img src="${pageContext.request.contextPath}/resource/images/system/image copy 4.png" alt="Indigo Plate">
          <h3>INDIGO PLATE</h3>
          <p class="price">$300</p>
        </div>
        <div class="product">
          <img src="${pageContext.request.contextPath}/resource/images/system/image copy 4.png" alt="Indigo Plate">
          <h3>INDIGO PLATE</h3>
          <p class="price">$300</p>
        </div>
        <div class="product">
          <span class="tag new">NEW</span>
          <img src="${pageContext.request.contextPath}/resource/images/system/mostP.png" alt="Nordic Vase">
          <h3>NORDIC VASE</h3>
          <p class="price">$310</p>
        </div>
        <div class="product">
          <span class="tag new">NEW</span>
          <img src="${pageContext.request.contextPath}/resource/images/system/mostP.png" alt="Nordic Vase">
          <h3>NORDIC VASE</h3>
          <p class="price">$310</p>
        </div>
      </div>
    </section>


<section class="about-preview">
    <div class="about-content">
      <h2>About ArtisanRoots</h2>
      <p>We connect local Nepali artisans with the world. Every item you see here is handmade with love, rooted in heritage, and crafted with care.</p>
      <a href="#" class="about-button">Learn More</a>
    </div>
  </section>
  

      
</div>

</div>
<footer class="footer">
  <div class="footer-container">
    <div class="footer-section-brand">
      <img src="${pageContext.request.contextPath}/resource/images/system/footer-logo2.png" width="250px">
      
    </div>

    <div class="footer-section">
      <h4>EXPLORE</h4>
      <ul>
        <li><a href="#">Our Products</a></li>
        <li><a href="#">Meet the Artists</a></li>
        <li><a href="#">Our Services</a></li>
        <li><a href="#">Contact Us</a></li>
      </ul>
    </div>

    <div class="footer-section">
      <h4>BLOG</h4>
      <ul>
        <li><a href="#">FAQs</a></li>
        <li><a href="#">Terms & Conditions</a></li>
        <li><a href="#">Privacy Policy</a></li>
        <li><a href="#">Shipping & Delivery</a></li>
        <li><a href="#">Returns & Exchange</a></li>
      </ul>
    </div>

    <div class="footer-section">
      <h4>ABOUT US</h4>
      <ul>
        <li><a href="mailto:support@handenorth.com">support@handenorth.com</a></li>
        <li><a href="#">ub.com</a></li>
        <li><a href="#">+234 567 890</a></li>
        <li><a href="#">Bhaktapur, Nepal</a></li>
      </ul>
    </div>
  </div>


    
  <hr>
  <div class="footer-bottom-section">
  <div class="email-section">
    <h3>NEWSLETTER</h3>
    <div class="email-container">
        <input type="email" placeholder="E-mail address" required>
        <button type="submit">SEND</button>
        
    </div>
  </div>
  <div class="social-media">
    <p>Follow us on</p>
    <div class="social-icons">
      <a href="#"><img src="${pageContext.request.contextPath}/resource/images/system/facebook.png" alt="Facebook" /></a>
      <a href="#"><img src="${pageContext.request.contextPath}/resource/images/system/whatsapp.png" alt="whatsapp" /></a>
      <a href="#"><img src="${pageContext.request.contextPath}/resource/images/system/insta.png" alt="Instagram" /></a>
    </div>
  </div>
  </div>
</footer>
</body>
</html>