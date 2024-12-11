<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Tout le header et la navbar ici     -->
<header class="header-area header-three">
    <div id="header-sticky" class="menu-area">
        <div class="container">
            <div class="second-menu">
                <div class="row align-items-center">
                    <div class="col-xl-2 col-lg-2">
                        <div class="logo">
                            <a href="index.html"><img src="${pageContext.request.contextPath}/assets/img/logo/logo.png" alt="logo"></a>
                        </div>
                    </div>
                   <div class="col-xl-7 col-lg-7">
                      
                        <div class="main-menu text-right text-xl-right">
                            <nav id="mobile-menu">
                                <ul>
                                    <li><a href="about.jsp">A propos de nous</a></li>
                                    <li><a href="projects.jsp">Projet</a></li>
                                    <li><a href="blog.jsp">Blog</a></li>
                                    <li><a href="blog.jsp">gerer </a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>   

                    <div class="col-xl-1 col-lg-1 text-center d-none d-lg-block mt-15 mb-15">
                        <a href="vue/auth/login.jsp" class="menu-tigger"><i class="fal fa-search"></i></a>
                    </div>
                    <%
                        if (session.getAttribute("currentUserId") == null) {
                            %> <div class="col-xl-2 col-lg-2 text-right d-none d-lg-block mt-15 mb-15">
                                <a href="vue/auth/login.jsp" class="btn ss-btn">Connexion</a>
                            </div>
                            <% }
                        else {
                            %> <div class="col-xl-2 col-lg-2 text-right d-none d-lg-block mt-15 mb-15">
                                <div class="menu-button has-sub">
                                    <a href="#" class="btn ss-btn"><i class="fas fa-user"></i></a>
                                    <ul class="sub-menu">
                                        <li><a href="profil.jsp">Profil</a></li>
                                        <li><a href="Deconnexion.jsp">Deconnexion</a></li>
                                    </ul>
                                </div>
                            </div>
                            <%
                        }
                    %>          
                        <div class="col-12">
                            <div class="mobile-menu"></div>
                        </div>
                </div>
            </div>
        </div>
    </div>
</header>

        <!-- offcanvas-area -->
        <div class="offcanvas-menu">
            <span class="menu-close"><i class="fas fa-times"></i></span>
          <form role="search" method="get" id="searchform"   class="searchform" action="http://wordpress.zcube.in/xconsulta/">
                            <input type="text" name="s" id="search" value="" placeholder="Search"  />
                            <button><i class="fa fa-search"></i></button>
                        </form>

                
                <div id="cssmenu3" class="menu-one-page-menu-container">
                    <ul id="menu-one-page-menu-2" class="menu">
                        <li class="menu-item menu-item-type-custom menu-item-object-custom"><a href="index.jsp">AgroEco</a></li>
                        <li class="menu-item menu-item-type-custom menu-item-object-custom"><a href="about.html">A propos de nous</a></li>
                        <li class="menu-item menu-item-type-custom menu-item-object-custom"><a href="projects.jsp">Nos projets</a></li>
                        <li class="menu-item menu-item-type-custom menu-item-object-custom"><a href="blog.jsp">Blog</a></li>
                    </ul>
                </div>  
                
                <div id="cssmenu2" class="menu-one-page-menu-container">
                    <ul id="menu-one-page-menu-1" class="menu">
                        <li class="menu-item menu-item-type-custom menu-item-object-custom"><a href="#home"><span>Numero de contact ici</span></a></li>
                        <!-- <li class="menu-item menu-item-type-custom menu-item-object-custom"><a href="#howitwork"><span>info@example.com</span></a></li> -->
                    </ul>
                </div>                
        </div>
        <div class="offcanvas-overly"></div>
             <!-- offcanvas-end -->