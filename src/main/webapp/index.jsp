<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Capatel - Solar Energy HTML Template</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <%@ include file="components/liens.jsp" %>

    </head>
    <body>
     <!-- header -->
        <%@ include file="components/header.jsp" %>
    <!-- header-end -->

    <!-- main-area -->
        <main>
            
            <!-- search-popup -->
		<div class="modal fade bs-example-modal-lg search-bg popup1" tabindex="-1" role="dialog">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content search-popup">
					<div class="text-center">
						<a href="#" class="close2" data-dismiss="modal" aria-label="Close">close</a>
					</div>
					<div class="row search-outer">
						<div class="col-md-11"><input type="text" placeholder="Search for products..." /></div>
						<div class="col-md-1 text-right"><a href="#"><i class="fa fa-search" aria-hidden="true"></i></a></div>
					</div>
				</div>
			</div>
		</div>
		<!-- /search-popup -->
            <!-- slider-area -->
            <section id="home" class="slider-area slider-four fix p-relative">
               
                <div class="slider-active">
				<div class="single-slider slider-bg d-flex align-items-center" style="background: url(img/slider/slider_img_bg.png) no-repeat; background-position: right top;">
                        <div class="container">
                           <div class="row justify-content-center pt-50">
                                <div class="col-lg-7 col-md-7">
                                    <div class="slider-content s-slider-content mt-150">
                                        <h5 data-animation="fadeInDown" data-delay=".4s">Bien venue sur AgroECO</h5>
                                         <h2 data-animation="fadeInUp" data-delay=".4s">nous Euvrons pour la protection de la nature</h2>
                                        <p data-animation="fadeInUp" data-delay=".6s">Curabitur nec laoreet nulla. Mauris aliquam malesuada nibh, sodales ullamp sapien imperdiet vel. Vestibulum fringilla purus metus.</p>
                                        
                                         <div class="slider-btn mt-30">                                          
                                            <a href="projects.jsp" class="btn ss-btn mr-15">En savoir plus</a>
                                             <a href="vue/auth/login.jsp" class="btn ss-btn active">Admin? Connecte toi</a>
                                        </div>   
                                        
                                                              
                                    </div>
                                </div>
                                <div class="col-lg-5 col-md-5">
                                    <div class="slider-img" data-animation="fadeInUp" data-delay=".4s">
                                   <img src="assets/img/slider/slider_img05.png" alt="slider_img05">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                   
                    </div>
                    
               
            </section>
            <!-- slider-area-end -->
             <!-- about-area -->
            <section id="about" class="about-area about-p pt-120 pb-130 p-relative" style="background: url(assets/img/bg/aliment-right.png) no-repeat; background-position: right center;">
                <div class="container">
                    <div class="row align-items-center">
                         <div class="col-lg-6 col-md-12 col-sm-12">
                            <div class="s-about-img p-relative" >
                                <img src="img/features/about_img.png" alt="img">    
                            </div>
                          <div class="about-text second-about">
                                    <span>50 </span>
                              Years of Experience
                                </div>
                        </div>
                        
					<div class="col-lg-6 col-md-12 col-sm-12">
                            <div class="about-content s-about-content pl-30">
                                <div class="about-title second-title pb-25">  
                                    <h5>ABOUT US</h5>
                                    <h2>What's Our Resources Story</h2>
                                </div>
                                
                                <p>Praesent fringilla lorem tincidunt, commodo erat sit amet, eleifend neque. Etiam nec vestibulum turpis, quis tempus elit. Sed tempus elit porttitor odio gravida, sed maximus turpis mattis. Vivamus at urna ut libero ornare congue.</p>
                                  <ul class="progress-outer  mt-30">
                                    <li>
                                        <div class="progress-box">
                                            <div class="progress blue">
                                            <span class="progress-left">
                                                <span class="progress-bar"></span>
                                            </span>
                                            <span class="progress-right">
                                                <span class="progress-bar"></span>
                                            </span>
                                            <div class="progress-value">20MI</div>
                                        </div>
                                            <h4>Project Done</h4>
                                        </div>
                                    </li>
                                  <li>
                                        <div class="progress-box">
                                            <div class="progress blue">
                                            <span class="progress-left">
                                                <span class="progress-bar"></span>
                                            </span>
                                            <span class="progress-right">
                                                <span class="progress-bar"></span>
                                            </span>
                                            <div class="progress-value">30MI</div>
                                        </div>
                                            <h4>Wrokers work</h4>
                                        </div>
                                    </li>
                                </ul>
                           
                               
                      
                            </div>
                        </div>
                     
                    </div>
                </div>
            </section>
            <!-- about-area-end -->
            
             <!-- counter-area -->
            <div class="counter-area p-relative pt-80 pb-80" style="background: url(assets/img/bg/counter-bg.png) repeat-x;">
                <div class="container">
               
                     <div class="row">
                          <div class="col-lg-4 col-md-12 col-sm-12">
                              <div class="section-title">                                 
                                  <h5>COUNTER</h5>
                                <h2>
                                  Fun Facts
                                </h2>
                               
                            </div>
                          </div>
                          <div class="col-lg-8 col-md-12 col-sm-12">
                              <div class="row text-center">
                                  <div class="col-lg-3 col-md-6 col-sm-12">
                                     <div class="single-counter wow fadeInUp animated" data-animation="fadeInDown animated" data-delay=".2s">
                                         <div class="icon">
                                             <img src="img/icon/cn-iocn01.png" alt="img">
                                         </div>

                                        <div class="counter p-relative">
                                            <span class="count">784</span>                             
                                            <p>Happy Clients</p>
                                        </div>

                                    </div>
                                </div>
                              <div class="col-lg-3 col-md-6 col-sm-12">
                                    <div class="single-counter wow fadeInUp animated" data-animation="fadeInDown animated" data-delay=".2s">
                                         <div class="icon">
                                             <img src="img/icon/cn-iocn02.png" alt="img">
                                         </div>
                                        <div class="counter p-relative">
                                            <span class="count">987</span>     
                                            <p>Happy Clients</p>
                                        </div>


                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-12">
                                    <div class="single-counter wow fadeInUp animated" data-animation="fadeInDown animated" data-delay=".2s">
                                        <div class="icon">
                                            <img src="img/icon/cn-iocn03.png" alt="img">
                                         </div>

                                        <div class="counter p-relative">
                                           <span class="count">974</span>
                                              <p>Employees</p>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-12">
                                    <div class="single-counter wow fadeInUp animated" data-animation="fadeInDown animated" data-delay=".2s">
                                         <div class="icon">
                                           <img src="img/icon/cn-iocn04.png" alt="img">
                                         </div>

                                        <div class="counter p-relative">
                                            <span class="count">687</span> 
                                        <p>Annual Turnover</p>
                                        </div>
                                    </div>
                                </div>
                              </div>
                                
                          </div>
                       
                         
                    </div>
                </div>
            </div>
            <!-- counter-area-end -->	
            
            <!-- features-area -->
            <section id="graph" class="features-area pt-80 pb-80"  style="background:url('assets/img/bg/cat-bg.png'); background-size: cover;">
                <div class="container">
          
                    <div class="row align-items-center">
                        
                        <div class="col-lg-12 col-md-12">
                            <div class="section-title cta-title text-center mb-30"> 
                            
                                 <h5>CALL TO ACTION</h5>     
                                <h2>Providing Value To Clients Through<br>Product & Innovation.</h2>
                            </div>
                            
                        
                        </div>
                        <div class="col-lg-12 col-md-12 text-center">
                            <a href="contact.html" class="btn ss-btn">Contact Us Now</a>
                        </div>
                        
                       
						
                    </div>
                    
                </div>
            </section>
            <!-- features-area-end -->
             
              <!-- blog-area -->
            <section id="blog" class="blog-area  p-relative pt-120 pb-120 fix" style="background: url(assets/img/bg/aliment-right4.png) no-repeat; background-position: right center;">
                <div class="container">
                    <div class="row align-items-center"> 
                        <div class="col-lg-12">
                            <div class="section-title center-align mb-50 text-center">
                                  <h5>OUR TEAM</h5>
                                    <h2> Latest Blog & News</h2>     
                               
                            </div>
                           
                        </div>
                    </div>
                    <div class="row">
                       <div class="col-lg-6 col-md-12">
                            <div class="single-post2 mb-30">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4">
                                        <div class="blog-thumb2">
                                            <a href="blog-details.html"><img src="img/blog/inner_b1.jpg" alt="img"></a>

                                        </div>
                                    </div>
                                    <div class="col-lg-8 col-md-8">
                                      <div class="blog-content2">     
                                                 <h4><a href="blog-details.html">Cras et dictum nisl nulla vitae auctor diam</a></h4>     
                                                    <div class="b-meta">
                                                <div class="b-meta">
                                                     <div class="meta-info">
                                                        <ul>
                                                            <li><i class="fal fa-user"></i> Admin</li>
                                                            <li><i class="fal fa-calendar-alt"></i> 24th March 2021</li>
                                                        </ul>
                                                    </div>
                                            </div>
                                            </div>
                                                    <p>Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.</p>
                                        </div>
                                    </div>

                                </div>
                                
                            </div>
                        </div>
                          <div class="col-lg-6 col-md-12">
                            <div class="single-post2 mb-30">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4">
                                        <div class="blog-thumb2">
                                            <a href="blog-details.html"><img src="img/blog/inner_b2.jpg" alt="img"></a>

                                        </div>
                                    </div>
                                    <div class="col-lg-8 col-md-8">
                                        <div class="blog-content2">     
                                                 <h4><a href="blog-details.html">Cras et dictum nisl nulla vitae auctor diam</a></h4>    
                                                    <div class="b-meta">
                                                     <div class="meta-info">
                                                        <ul>
                                                            <li><i class="fal fa-user"></i> Admin</li>
                                                            <li><i class="fal fa-calendar-alt"></i> 24th March 2021</li>
                                                        </ul>
                                                    </div>
                                            </div>
                                                    <p>Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.</p>
                                        </div>
                                    </div>

                                </div>
                                
                            </div>
                        </div>
                         <div class="col-lg-6 col-md-12">
                            <div class="single-post2 mb-30">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4">
                                        <div class="blog-thumb2">
                                            <a href="blog-details.html"><img src="img/blog/inner_b3.jpg" alt="img"></a>

                                        </div>
                                    </div>
                                    <div class="col-lg-8 col-md-8">
                                        <div class="blog-content2">     
                                                 <h4><a href="blog-details.html">Cras et dictum nisl nulla vitae auctor diam</a></h4>    
                                                    <div class="b-meta">
                                               <div class="b-meta">
                                                     <div class="meta-info">
                                                        <ul>
                                                            <li><i class="fal fa-user"></i> Admin</li>
                                                            <li><i class="fal fa-calendar-alt"></i> 24th March 2021</li>
                                                        </ul>
                                                    </div>
                                            </div>
                                            </div>
                                                 <p>Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.</p>
                                        </div>
                                    </div>

                                </div>
                                
                            </div>
                        </div>
                         <div class="col-lg-6 col-md-12">
                            <div class="single-post2 mb-30">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4">
                                        <div class="blog-thumb2">
                                            <a href="blog-details.html"><img src="img/blog/inner_b4.jpg" alt="img"></a>

                                        </div>
                                    </div>
                                    <div class="col-lg-8 col-md-8">
                                       <div class="blog-content2">     
                                                 <h4><a href="blog-details.html">Cras et dictum nisl nulla vitae auctor diam</a></h4>    
                                                    <div class="b-meta">
                                                  <div class="b-meta">
                                               <div class="b-meta">
                                                     <div class="meta-info">
                                                        <ul>
                                                            <li><i class="fal fa-user"></i> Admin</li>
                                                            <li><i class="fal fa-calendar-alt"></i> 24th March 2021</li>
                                                        </ul>
                                                    </div>
                                            </div>
                                            </div>
                                            </div>
                                             <p>Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.</p>
                                        </div>
                                    </div>

                                </div>
                                
                            </div>
                        </div>
                    <div class="col-lg-12 col-md-12 text-center">
                            <a href="blog.html" class="btn ss-btn">View All News</a>
                        </div>
                        
                    </div>
                </div>
            </section>
            <!-- blog-area-end -->
        </main>
        <!-- main-area-end -->

        <!-- debut du footer  -->
        <%@ include file="components/footer.jsp" %>
        <!-- fin du footer -->


        <%@ include file="components/scripts.jsp" %>
		<!-- JS here -->
</html>