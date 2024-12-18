<!doctype html>
<html class="no-js" lang="fr">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>AgroEco</title>
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

        <section class="breadcrumb-area d-flex align-items-center" style="background-image:url(assets/img/testimonial/test-bg.png)">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-xl-12 col-lg-12">
                        <div class="breadcrumb-wrap text-left">
                            <div class="breadcrumb-title">
                                <h2>Nos Projets</h2>    
                                <div class="breadcrumb-wrap">
                          
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Projets</li>
                                </ol>
                            </nav>
                        </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </section>
        <!-- breadcrumb-area-end -->
         <!-- gallery-area -->
        <section id="work" class="pt-120 pb-90" style="background: url(assets/img/bg/aliment-right2.png) no-repeat; background-position: right center;">
            <div class="container">   
               
                <div class="portfolio ">
           
                   <div class="row align-items-center mb-50 text-center">                          
                        <div class="col-lg-12">
                             <div class="my-masonry">
                        <div class="button-group filter-button-group ">
                            <button class="active" data-filter="*">Tout les projets</button>
                            <button data-filter=".prd">Programme de reduction d'energie </button>
                            <button data-filter=".senibilisation">Sensibilisation et formation </button>	
                            <button data-filter=".efficasite">Amélioration de l'Efficacité Énergétique</button>
                            
                        </div>
                    </div>
                        </div>
                    </div>

            <div class="grid col3">
                
                <div class="grid-item prd">     
               
                    <a href="projects-detail.html">
                        <figure class="gallery-image">
                          <img src="img/gallery/protfolio-img01.png" alt="img" class="img">      
                            <figcaption>
                                <h4>Hydropower 01</h4>
                            </figcaption>
                        </figure>
                      </a>
                       
                </div>
                <div class="grid-item senibilisation">
                      <a href="projects-detail.html">
                        <figure class="gallery-image">
                          <img src="img/gallery/protfolio-img02.png" alt="img" class="img">      
                            <figcaption>
                                <h4>Solar Energy 01</h4>
                            </figcaption>
                        </figure>
                      </a>
                     
                       
                </div>
                <div class="grid-item senibilisation smm">
                   <a href="projects-detail.html">
                        <figure class="gallery-image">
                          <img src="img/gallery/protfolio-img03.png" alt="img" class="img">      
                            <figcaption>
                                <h4>Wind Energy01</h4>
                            </figcaption>
                        </figure>
                      </a>
               
                </div>
                <div class="grid-item prd">    
                         <a href="projects-detail.html">
                        <figure class="gallery-image">
                          <img src="img/gallery/protfolio-img04.png" alt="img" class="img">      
                            <figcaption>
                                <h4>Hydropower 02</h4>
                            </figcaption>
                        </figure>
                      </a>
                 
                       
                </div>
                <div class="grid-item efficasite smm">
                      <a href="projects-detail.html">
                        <figure class="gallery-image">
                          <img src="img/gallery/protfolio-img05.png" alt="img" class="img">      
                            <figcaption>
                                <h4>Solar Energy 02</h4>
                            </figcaption>
                        </figure>
                      </a>
                     
                       
                </div>
                <div class="grid-item efficasite">
                        <a href="projects-detail.html">
                        <figure class="gallery-image">
                          <img src="img/gallery/protfolio-img06.png" alt="img" class="img">      
                            <figcaption>
                                <h4>Wind Energy02</h4>
                            </figcaption>
                        </figure>
                      </a>
                </div>
              
                                 
                </div>

        </div>
            </div>
        </section>
         <!-- gallery-area-end -->

        </main>
        <!-- main-area-end -->

        <!-- footer -->
        <%@ include file="components/footer.jsp" %>
        <!-- footer-end -->

        <%@ include file="components/scripts.jsp" %>
		<!-- JS here -->
</html>