<!doctype html>
<html class="no-js" lang="fr">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>AgroEco ° Partie</title>
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
						<a href="#" class="close2" data-dismiss="modal" aria-label="Close">* close</a>
					</div>
					<div class="row search-outer">
						<div class="col-md-11"><input type="text" placeholder="Search for products..." /></div>
						<div class="col-md-1 text-right"><a href="#"><i class="fa fa-search" aria-hidden="true"></i></a></div>
					</div>
				</div>
			</div>
		</div>
		<!-- /search-popup -->
            
            <!-- breadcrumb-area -->
            <section class="breadcrumb-area d-flex align-items-center" style="background-image:url(img/testimonial/test-bg.png)">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-12 col-lg-12">
                            <div class="breadcrumb-wrap text-left">
                                <div class="breadcrumb-title">
                                    <h2>Blog</h2>    
                                    <div class="breadcrumb-wrap">
                              
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="index.html">AgroEco</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Blog</li>
                                    </ol>
                                </nav>
                            </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </section>

            <section class="inner-blog pt-120 pb-120">
                <div class="container">


                    <div class="row">
                        <div class="col-lg-8">


                            <div class="bsingle__post mb-50">
                                <div class="bsingle__post-thumb">
                                    <img src="img/blog/inner_b1.jpg" alt="">
                                </div>
                                <div class="bsingle__content">
                                    <div class="admin">
                                        <a href="#"><i class="far fa-user"></i>By Kadji</a>
                                    </div>
                                    
                                    
                                    <h2><a href="blog-details.html">Lorem ipsum dolor sit amet, consectetur
                                            cing elit, sed do eiusmod tempor.</a></h2>
                                    <p>Novia's spaciously two bedroom apartments are perfect for families and even business partners. Look out into the Manhattan skyline from the open fully equipped kitchen.</p>
                                    <div class="meta-info">
                                        <ul>
                                            <li><i class="fal fa-calendar-alt"></i> 24th March 2019</li>
                                        </ul>
                                    </div>
                                    
                                </div>
                            </div>

                            <!-- <div class="pagination-wrap">
                                <nav>
                                    <ul class="pagination">
                                        <li class="page-item"><a href="#"><i class="fas fa-angle-double-left"></i></a></li>
                                        <li class="page-item active"><a href="#">1</a></li>
                                        <li class="page-item"><a href="#">2</a></li>
                                        <li class="page-item"><a href="#">3</a></li>
                                        <li class="page-item"><a href="#">...</a></li>
                                        <li class="page-item"><a href="#">10</a></li>
                                        <li class="page-item"><a href="#"><i class="fas fa-angle-double-right"></i></a></li>
                                    </ul>
                                </nav>
                            </div> -->
                        </div>
                        <!-- #right side -->
                        <div class="col-sm-12 col-md-12 col-lg-4">
                           <aside class="sidebar-widget">
                              <section id="search-3" class="widget widget_search">
                                 <h2 class="widget-title">Rechercher</h2>
                                 <form role="search" method="get" class="search-form" action="http://wordpress.zcube.in/finco/">
                                    <label>
                                    <span class="screen-reader-text">Rechercher pour:</span>
                                    <input type="search" class="search-field" placeholder="Search &hellip;" value="" name="s" />
                                    </label>
                                    <input type="submit" class="search-submit" value="Search" />
                                 </form>
                              </section>
                              <section id="custom_html-5" class="widget_text widget widget_custom_html">
                                 <h2 class="widget-title">Follow Us</h2>
                                 <div class="textwidget custom-html-widget">
                                    <div class="widget-social">
                                       <a href="#"><i class="fab fa-twitter"></i></a>
                                       <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                       <a href="#"><i class="fab fa-facebook-f"></i></a>
                                       <a href="#"><i class="fab fa-instagram"></i></a>
                                       <a href="#"><i class="fab fa-wordpress"></i></a>
                                    </div>
                                 </div>
                              </section>
                              
                           </aside>
                        </div>
                        <!-- #right side end -->
                    </div>

                </div>
            </section>
            <!-- breadcrumb-area-end -->
        </main>
        <!-- main-area-end -->

        <!-- footer -->
        <%@ include file="components/footer.jsp" %>
        <!-- footer-end -->

        <%@ include file="components/scripts.jsp" %>
		<!-- JS here -->
</html>