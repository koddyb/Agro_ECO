<%@ include file="components/header.jsp" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>AGRO Eco</title>
    <%@ include file="components/liens.jsp" %>
</head>

<body>
    <main>
        <!-- slider Area Start-->
        <div class="slider-area position-relative">
            <div class="slider-active dot-style">
                <!-- Single Slider -->
                <div class="single-slider hero-overly slider-height slider-bg1 d-flex align-items-center mb-5" style="box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.1);">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10">
                                <div class="hero__caption">
                                    <h1 data-animation="fadeInUp" data-delay=".2s">AGRO Eco</h1>
                                    <P data-animation="fadeInUp" data-delay=".4s">Ensemble pour une vie plus verte <br> et saine</P>
                                    <!-- Hero-btn -->
                                    <div class="hero__btn">
                      <!-- Section dashboard -->
                                    <a href="vue/auth/login.jsp" class="hero-btn mb-10"  data-animation="fadeInUp" data-delay=".8s">Se connecter</a>                             
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="single-slider slider-height d-flex align-items-center">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10">
                                <div class="hero__caption">
                                    <h1 style="color: black; font-size: 50px !important;" data-animation="fadeInUp" data-delay=".2s">NOS CHIFFRES SUR L'ECOLOGIE</h1>
                                    <P style="color: black;" data-animation="fadeInUp" data-delay=".4s">Ensemble pour une vie plus verte <br> et saine</P>
                                    <!-- Hero-btn -->
                                    <div class="hero__btn">
                      <!-- Section dashboard -->
                      <section class="dashboard-section">
                        <div class="container">
                          <div class="row">
                            <div class="col-md-12">
                              <h2 class="section-title">Dashboard</h2>
                              <div class="dashboard-container">
                                <div class="dashboard-card">
                                  <h3 class="card-title">Nombre de visiteurs</h3>
                                  <canvas id="visiteursChart" width="400" height="200"></canvas>
                                </div>
                                <div class="dashboard-card">
                                  <h3 class="card-title">Taux de rebond</h3>
                                  <canvas id="rebondChart" width="400" height="200"></canvas>
                                </div>
                                <div class="dashboard-card">
                                  <h3 class="card-title">Pages vues</h3>
                                  <canvas id="pagesVuesChart" width="400" height="200"></canvas>
                                </div>
                                <div class="dashboard-card">
                                  <h3 class="card-title">Dur&eacute;e moyenne de session</h3>
                                  <canvas id="dureeSessionChart" width="400" height="200"></canvas>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </section>
                      
                      <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                      
                      <script>
                        // Données fictives
                        const visiteursData = [1234, 1256, 1345, 1456, 1567, 1678, 1789, 1890, 1900, 2000, 2100, 2200];
                        const rebondData = [25, 23, 24, 26, 27, 28];
                        const pagesVuesData = [5678, 5890, 6012, 6234, 6456, 6678];
                        const dureeSessionData = [120, 130, 140, 150, 160, 170];
                      
                        // Graphiques
                        const ctxVisiteurs = document.getElementById('visiteursChart').getContext('2d');
                        const ctxRebond = document.getElementById('rebondChart').getContext('2d');
                        const ctxPagesVues = document.getElementById('pagesVuesChart').getContext('2d');
                        const ctxDureeSession = document.getElementById('dureeSessionChart').getContext('2d');
                      
                        const visiteursChart = new Chart(ctxVisiteurs, {
                          type: 'bar',
                          data: {
                            labels: ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Aout', 'Septembre', 'Octobre', 'Novembre', 'Décembre'],
                            datasets: [{
                              label: 'Nombre de visiteurs',
                              data: visiteursData,
                              backgroundColor: 'rgba(75, 192, 192, 0.2)',
                              borderColor: 'rgba(75, 192, 192, 1)',
                              borderWidth: 2
                            }]
                          },
                          options: {
                            scales: {
                              y: {
                                beginAtZero: true
                              }
                            }
                          }
                        });
                      
                        const rebondChart = new Chart(ctxRebond, {
                            type: 'line',
                            data: {
                                labels: ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin'],
                                datasets: [{
                                    label: 'Taux de rebond',
                                    data: rebondData,
                                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                                    borderColor: 'rgba(255, 99, 132, 1)',
                                    borderWidth: 1
                                }]
                            },
                            options: {
                                scales: {
                                    y: {
                                        beginAtZero: true
                                    }
                                }
                            }
                        });

                        const pagesVuesChart = new Chart(ctxPagesVues, {
                            type: 'line',
                            data: {
                                labels: ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin'],
                                datasets: [{
                                    label: 'Pages vues',
                                    data: pagesVuesData,
                                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                                    borderColor: 'rgba(54, 162, 235, 1)',
                                    borderWidth: 1
                                }]
                            },
                            options: {
                                scales: {
                                    y: {
                                        beginAtZero: true
                                    }
                                }
                            }
                        });
                              
                        const dureeSessionChart = new Chart(ctxDureeSession, {
                            type: 'line',
                            data: {
                                labels: ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin'],
                                datasets: [{
                                    label: 'Durée moyenne de session',
                                    data: dureeSessionData,
                                    backgroundColor: 'rgba(255, 206, 86, 0.2)',
                                    borderColor: 'rgba(255, 206, 86, 1)',
                                    borderWidth: 1
                                }]
                            },
                            options: {
                                scales: {
                                    y: {
                                        beginAtZero: true
                                    }
                                }
                            }
                        });
                      </script>  
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- slider Area End-->
    </main>
    
    <!-- Footer -->
    <%@ include file="components/footer.jsp" %>
    
</body>
</html>

