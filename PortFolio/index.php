<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">


        <!--==================== UNICONS ====================-->
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
        
        
        <!--==================== SWIPER CSS ====================-->
        <link rel="stylesheet" href="assets/css/swiper-bundle.min.css">
        
        <!--==================== CSS ====================-->
        <link rel="stylesheet" href="assets/css/styles.css">

		<!--==================== FAVICON ====================-->
        <link rel="icon" type="image/png" href="assets/img/logo.png">

        <title>Portfolio Loris Esteve</title>
    </head>
    <body>
        <!--==================== HEADER ====================-->
        <header class="header" id="header">
            <nav class="nav container">
                <a href="#home" class="nav__logo"><img class="nav__logo" width="40" src="assets/img/logo.png"></a>

                <div class="nav__menu" id="nav-menu">
                    <ul class="nav__list grid">
                        <li class="nav__item">
                            <a href="#home" class="nav__link active-link">
                                <i class="uil uil-estate nav__icon"></i> Accueil
                            </a>
                        </li>
                        <li class="nav__item">
                            <a href="#about" class="nav__link">
                                <i class="uil uil-user nav__icon"></i> À propos de moi
                            </a>
                        </li>
                        <li class="nav__item">
                            <a href="#skills" class="nav__link">
                                <i class="uil uil-file-alt nav__icon"></i> Compétences
                            </a>
                        </li>
                        <li class="nav__item">
                            <a href="#qualifications" class="nav__link">
                                <i class="uil uil-graduation-cap nav__icon"></i> Parcours
                            </a>
                        </li>
                        <li class="nav__item">
                            <a href="#services" class="nav__link">
                                <i class="uil uil-briefcase-alt nav__icon"></i> Services
                            </a>
                        </li>
                        <li class="nav__item">
                            <a href="#portfolio" class="nav__link">
                                <i class="uil uil-scenery nav__icon"></i> Portfolio
                            </a>
                        </li>
                        <li class="nav__item">
                            <a href="#contact" class="nav__link">
                                <i class="uil uil-message nav__icon"></i> Contact
                            </a>
                        </li>
                    </ul>
                    <i class="uil uil-times nav__close" id="nav-close"></i>
                </div>

                <div class="nav__btns">
                    <!-- Theme change button -->
                    <i class="uil uil-moon change-theme" id="theme-button"></i>

                    <div class="nav__toggle" id="nav-toggle">
                        <i class="uil uil-apps"></i>
                    </div>
                </div>
            </nav>
        </header>

        <!--==================== MAIN ====================-->
        <main class="main">
            <!--==================== HOME ====================-->
            <section class="home section" id="home">
                <div class="home__container container grid">
                    <div class="home__content grid">
                        <div class="home__social">
                            <a href="https://www.linkedin.com/in/profil-loris-esteve/" target="_blank" class="home__social-icon">
                                <i class="uil uil-linkedin-alt"></i>
                            </a>

                            <a href="https://github.com/" target="_blank" class="home__social-icon">
                                <i class="uil uil-github-alt"></i>
                            </a>
                        </div>

                        <div class="home__img">
                            <svg class="home__blob" viewBox="0 0 200 187" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                <mask id="mask0" mask-type="alpha">
                                    <path d="M190.312 36.4879C206.582 62.1187 201.309 102.826 182.328 134.186C163.346 165.547 
                                    130.807 187.559 100.226 186.353C69.6454 185.297 41.0228 161.023 21.7403 129.362C2.45775 
                                    97.8511 -7.48481 59.1033 6.67581 34.5279C20.9871 10.1032 59.7028 -0.149132 97.9666 
                                    0.00163737C136.23 0.303176 174.193 10.857 190.312 36.4879Z"/>
                                </mask>
                                <g mask="url(#mask0)">
                                    <path d="M190.312 36.4879C206.582 62.1187 201.309 102.826 182.328 134.186C163.346 
                                    165.547 130.807 187.559 100.226 186.353C69.6454 185.297 41.0228 161.023 21.7403 
                                    129.362C2.45775 97.8511 -7.48481 59.1033 6.67581 34.5279C20.9871 10.1032 59.7028 
                                    -0.149132 97.9666 0.00163737C136.23 0.303176 174.193 10.857 190.312 36.4879Z"/>
                                    
                                    <image class="home__blob-img" x="22" y="-28" xlink:href="assets/img/perfil3.png"/>
                                </g>
                            </svg>                            
                        </div>
                    </div>

                    <div class="home__data">
                        <h1 class="home__title">Bonjour, moi c'est Loris !</h1>
                        <h3 class="home__subtitle">Développeur Front-End</h3>
                        <p class="home__description">Goût du challenge, j'aime me lancer des défis et sortir de ma zone de confort.
                            Esprit d'équipe, aisance relationnelle et bonnes capacités d'adaptation : Le partage et la communication sont très importants pour moi, pour le travail de groupe en projet et pour l'échange de connaissances et de compétences.</p>
                            <a href="#contact" class="button button--flex contact__button">
                                Contactez-moi <i class="uil uil-message button__icon"></i>
                            </a>
                    </div>

                </div>
            </section>

            <!--==================== ABOUT ====================-->
            <section class="about section" id="about">
               <h2 class="section__title">À propos de moi</h2> 
               <span class="section__subtitle">Introduction</span>
            
                <div class="about__container container grid">
                    <img src="assets/img/about2.png" alt="" class="about__img">
                
                    <div class="about_data">
                        <p class="about__description">Passionné par l’informatique depuis mon enfance, j’ai toujours voulu faire un métier dans ce secteur car les nouvelles technologies ainsi que l’informatique en général me passionne vraiment.<br/>J’ai le goût du challenge, j’aime sortir de ma zone de confort et apprendre de manière autonome, l’esprit d’équipe, le partage et la communication sont très importants pour moi.<br/>Disponible dès maintenant.<br/>Permis de conduire.</p>
                    
                        <div class="about__info">
                            <div>
                                <span class="about__info-title">1</span>   
                                <span class="about__info-name">An <br/> d'experience</span>
                            </div>
                            <div>
                                <span class="about__info-title">Plus de 6</span>   
                                <span class="about__info-name">Languages <br/> Connus</span>
                            </div>
                            <div>
                                <span class="about__info-title">3</span>   
                                <span class="about__info-name">Années <br/> Post-bac</span>
                            </div>
                        </div>
                    </div>

                    <div class="about__buttons">
                        <a download="" href="assets/pdf/Cv.pdf" class="button button--flex cv__button">
                          Télécharger mon CV<i class="uil uil-download-alt button__icon"></i>
                        </a>
                    </div>
                </div>
            </section>

            <!--==================== SKILLS ====================-->
            <section class="skills section" id="skills">
                <h2 class="section__title">Compétences</h2>
                <span class="section__subtitle">Mon niveau technique</span>
            
                <div class="skills_container container">
                    <div>
                        <!--==================== SKILLS 1 ====================-->
                        <div class="skills__content skills__open">
                            <div class="skills__header">
                                <i class="uil uil-brackets-curly skills__icon"></i>

                                <div>
                                    <h1 class="skills__titles">Front-End</h1>
                                    <span class="skills__subtitle">Plus de 3 ans</span>
                                </div>

                                <i class="uil uil-angle-down skills__arrow"></i>
                            </div>

                            <div class="skills__list grid">
                                <div class="skills__data">
                                    <div class="skills__titles">
                                        <h3 class="skills__name">HTML</h3>
                                        <span class="skills__number">90%</span>
                                    </div>
                                    <div class="skills__bar">
                                        <span class="skills__percentage skills__html"></span>
                                    </div>
                                </div>

                                <div class="skills__data">
                                    <div class="skills__titles">
                                        <h3 class="skills__name">CSS</h3>
                                        <span class="skills__number">80%</span>
                                    </div>
                                    <div class="skills__bar">
                                        <span class="skills__percentage skills__css"></span>
                                    </div>
                                </div>

                                <div class="skills__data">
                                    <div class="skills__titles">
                                        <h3 class="skills__name">JavaScript</h3>
                                        <span class="skills__number">20%</span>
                                    </div>
                                    <div class="skills__bar">
                                        <span class="skills__percentage skills__js"></span>
                                    </div>
                                </div>

                                <div class="skills__data">
                                    <div class="skills__titles">
                                        <h3 class="skills__name">React</h3>
                                        <span class="skills__number">50%</span>
                                    </div>
                                    <div class="skills__bar">
                                        <span class="skills__percentage skills__react"></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--==================== SKILLS 2 ====================-->
                        <div class="skills__content skills__close">
                            <div class="skills__header">
                                <i class="uil uil-server-network skills__icon"></i>

                                <div>
                                    <h1 class="skills__titles">Back-End</h1>
                                    <span class="skills__subtitle">Plus de 3 ans</span>
                                </div>

                                <i class="uil uil-angle-down skills__arrow"></i>
                            </div>

                            <div class="skills__list grid">
                                <div class="skills__data">
                                    <div class="skills__titles">
                                        <h3 class="skills__name">PHP</h3>
                                        <span class="skills__number">60%</span>
                                    </div>
                                    <div class="skills__bar">
                                        <span class="skills__percentage skills__php"></span>
                                    </div>
                                </div>

                                <div class="skills__data">
                                    <div class="skills__titles">
                                        <h3 class="skills__name">Python</h3>
                                        <span class="skills__number">20%</span>
                                    </div>
                                    <div class="skills__bar">
                                        <span class="skills__percentage skills__python"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div>
                        <!--==================== SKILLS 3 ====================-->
                        <div class="skills__content skills__close">
                            <div class="skills__header">
                                <i class="uil uil-swatchbook skills__icon"></i>

                                <div>
                                    <h1 class="skills__titles">Design Graphique</h1>
                                    <span class="skills__subtitle">Plus de 1 an</span>
                                </div>

                                <i class="uil uil-angle-down skills__arrow"></i>
                            </div>

                            <div class="skills__list grid">
                                <div class="skills__data">
                                    <div class="skills__titles">
                                        <h3 class="skills__name">Photoshop</h3>
                                        <span class="skills__number">80%</span>
                                    </div>
                                    <div class="skills__bar">
                                        <span class="skills__percentage skills__photoshop"></span>
                                    </div>
                                </div>

                                <div class="skills__data">
                                    <div class="skills__titles">
                                        <h3 class="skills__name">Illustrator</h3>
                                        <span class="skills__number">60%</span>
                                    </div>
                                    <div class="skills__bar">
                                        <span class="skills__percentage skills__illustrator"></span>
                                    </div>
                                </div>

                                <div class="skills__data">
                                    <div class="skills__titles">
                                        <h3 class="skills__name">Adobe XD</h3>
                                        <span class="skills__number">80%</span>
                                    </div>
                                    <div class="skills__bar">
                                        <span class="skills__percentage skills__xd"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!--==================== QUALIFICATION ====================-->
            <section class="qualification section" id="qualifications">
                <h2 class="section__title">Parcours personnel</h2>
                <span class="section__subtitle">Scolaire/Professionnel</span>

                <div class="qualification__container container">
                    <div class="qualification__tabs">
                        <div class="qualification__button button--flex qualification__active" data-target='#education'>
                            <i class="uil uil-graduation-cap qualification__icon"></i>
                            Education
                        </div>

                        <div class="qualification__button button--flex" data-target='#work'>
                            <i class="uil uil-briefcase-alt qualification__icon"></i>
                            Emploi
                        </div>
                    </div>

                    <div class="qualification__sections">
                        <!--==================== QUALIFICATION CONTENT 1 ====================-->
                        <div class="qualification__content qualification__active" data-content id="education">
                            <!--==================== QUALIFICATION 1 ====================-->
                            <div class="qualification__data">
                                <div>
                                    <h3 class="qualification__title">Institut G4 en alternance pour valider le Titre RNCP | Chef de projet systèmes d’information - Numérique & Management</h3>
                                    <span class="qualification__subtitle">Création et maintenance de sites web vitrines avec WordPress
                                    	<br/>Création de système d'export de base de donnée en PHP
                                    	<br/>Création d'un outil de création de sites web statiques avec Gatsby en React
                                    	<br/>Création de plateforme de formations e-learning sur WordPress avec le plugin LMS LearnDash
                                    	<br/>Front-End CRM crée sur mesure<br/><br/>Institut G4, Marseille</span>
                                    <div class="qualification__calendar">
                                        <i class="uil uil-calendar-alt"></i>
                                        2020 - 2023
                                    </div>
                                </div>

                                <div>
                                    <span class="qualification__rounder"></span>
                                    <span class="qualification__line"></span>
                                </div>
                            </div>
                            <!--==================== QUALIFICATION 2 ====================-->
                            <div class="qualification__data">
                                <div></div>

                                <div>
                                    <span class="qualification__rounder"></span>
                                    <span class="qualification__line"></span>
                                </div>

                                <div>
                                    <h3 class="qualification__title">Brevet de Technicien Supérieur Systèmes Numériques option Informatique et Réseaux</h3>
                                    <span class="qualification__subtitle">Projet de groupe sur une station météo (Client – Serveur TCP, Micro base de données)
										<br/>Création d’interfaces homme-machine
										<br/>Avis très favorable, Tableau d’honneur<br/><br/>Lycée Jean Perrin, Marseille
									</span>
                                    <div class="qualification__calendar">
                                        <i class="uil uil-calendar-alt"></i>
                                        2018 - 2020
                                    </div>
                                </div>
                            </div>
                            <!--==================== QUALIFICATION 3 ====================-->
                            <div class="qualification__data">
                                <div>
                                    <h3 class="qualification__title">Baccalauréat Sciences et Technologies du Développement Durable option Energie Environnement – Mention Assez Bien</h3>
                                    <span class="qualification__subtitle">Projet de groupe sur une serre autonome
										<br/>Programmation sur Arduino (capteurs de température, d’humidité)<br/><br/>Lycée Les Iscles, Manosque
									</span>
                                    <div class="qualification__calendar">
                                        <i class="uil uil-calendar-alt"></i>
                                        2015 - 2018
                                    </div>
                                </div>

                                <div>
                                    <span class="qualification__rounder"></span>
                                </div>
                            </div>
                        </div>
                        <!--==================== QUALIFICATION CONTENT 2 ====================-->
                        <div class="qualification__content" data-content id="work">
                            <!--==================== QUALIFICATION 1 ====================-->
                            <div class="qualification__data">
                                <div>
                                    <h3 class="qualification__title">Alternance - Développeur Front-End </h3>
                                    <span class="qualification__subtitle">Tekzone, Marseille</span>
                                    <div class="qualification__calendar">
                                        <i class="uil uil-calendar-alt"></i>
                                        2020 - 2023
                                    </div>
                                </div>

                                <div>
                                    <span class="qualification__rounder"></span>
                                    <span class="qualification__line"></span>
                                </div>
                            </div>
                            <!--==================== QUALIFICATION 2 ====================-->
                            <div class="qualification__data">
                                <div></div>

                                <div>
                                    <span class="qualification__rounder"></span>
                                    <span class="qualification__line"></span>
                                </div>
                                <div>
                                    <h3 class="qualification__title">Stage en informatique</h3>
                                    <span class="qualification__subtitle">Création de serveurs virtuels sur VMWare avec Windows Server 2016<br/><br/>Installation et configuration 		des rôles DHCP et DNS pour le partage de fichiers et de données<br/><br/>Administration Réseau (création de sessions étudiantes Windows 		avec des droits limités)
										Surveillance de ressources avec Kaseya, logiciel de monitoring (Utilisation processeur, RAM, Disque Dur ...)<br/><br/>OPTIMAL.SI, Manosque</span>
									</span>
                                    <div class="qualification__calendar">
                                        <i class="uil uil-calendar-alt"></i>
                                        2019 (6 semaines)
                                    </div>
                                </div>
                            </div>
                            <!--==================== QUALIFICATION 3 ====================-->
                            <div class="qualification__data">
                                <div>
                                    <h3 class="qualification__title">Employé de rayon</h3>
                                    <span class="qualification__subtitle">Mise en rayons de différents produits<br/><br/>Casino, Forcalquier</span>
                                	</span>
                                    <div class="qualification__calendar">
                                        <i class="uil uil-calendar-alt"></i>
                                        2019 (4 semaines)
                                    </div>
                                </div>

                                <div>
                                    <span class="qualification__rounder"></span>
                                    <span class="qualification__line"></span>
                                </div>
                            </div>
                            <!--==================== QUALIFICATION 4 ====================-->
                            <div class="qualification__data">
                                <div></div>

                                <div>
                                    <span class="qualification__rounder"></span>    
                                </div>
                                <div>
                                    <h3 class="qualification__title">Stage d’observation</h3>
                                    <span class="qualification__subtitle">Observation sur les postes informatiques, logiciels utilisés propres à l'entreprise (Pesée de poids 			lourds avec bennes à recycler, enregistrements base de données (nom, prénom, adresse, ville, poids du camion)<br/><br/>CMR Recyclage, La Brillanne</span>
                                	</span>
                                    <div class="qualification__calendar">
                                        <i class="uil uil-calendar-alt"></i>
                                        2014 (1 semaine)
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!--==================== SERVICES ====================-->
            <section class="services section" id="services">
                <h2 class="section__title">Services</h2>
                <span class="section__subtitle">Ce que je propose</span>
            
                <div class="services__container container grid">
                    <!--==================== SERVICES 1 ====================-->
                    <div class="services__content">
                        <div>
                            <i class="uil uil-web-grid services__icon"></i>
                            <h3 class="services__title">Ui/Ux <br/> Designer</h3>
                        </div>

                        <span class="button button--flex button--small button--link services__button">
                            Voir plus
                            <i class="uil uil-arrow-right button__icon"></i>
                        </span>

                        <div class="services__modal">
                            <div class="services__modal-content">
                                <h4 class="services__modal-title">Ui/Ux <br/> Designer</h4>
                                <i class="uil uil-times services__modal-close"></i>

                                <ul class="services__modal-services grid">
                                    <li class="services__modal-service">
                                        <i class="uil uil-tear services__modal-icon"></i>
                                        <p>Liquid design</p>
                                    </li>
                                    <li class="services__modal-service">
                                        <i class="uil uil-circle services__modal-icon"></i>
                                        <p>Flat design</p>
                                    </li>
                                    <li class="services__modal-service">
                                        <i class="uil uil-brush-alt services__modal-icon"></i>
                                        <p>Modern design</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!--==================== SERVICES 2 ====================-->
                    <div class="services__content">
                        <div>
                            <i class="uil uil-arrow services__icon"></i>
                            <h3 class="services__title">Développement <br/> Front-End</h3>
                        </div>

                        <span class="button button--flex button--small button--link services__button">
                            Voir plus
                            <i class="uil uil-arrow-right button__icon"></i>
                        </span>

                        <div class="services__modal">
                            <div class="services__modal-content">
                                <h4 class="services__modal-title">Développement <br/> Front-End</h4>
                                <i class="uil uil-times services__modal-close"></i>

                                <ul class="services__modal-services grid">
                                    <li class="services__modal-service">
                                        <i class="uil uil-window services__modal-icon"></i>
                                        <p>Site vitrine</p>
                                    </li>
                                    <li class="services__modal-service">
                                        <i class="uil uil-euro services__modal-icon"></i>
                                        <p>Site E-Commerce</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!--==================== PORTFOLIO ====================-->
            <section class="portfolio section" id="portfolio">
                <h2 class="section__title">Portfolio</h2>
                <span class="section__subtitle">Projets les plus récents</span>

                <div class="portfolio__container container swiper-container">
                    <div class="swiper-wrapper">
                         <!--==================== PORTFOLIO 1 ====================-->
                         <div class="portfolio__content grid swiper-slide">
                             <img src="assets/img/portfolio1.png" alt="" class="portfolio__img">

                             <div class="portfolio__data">
                                 <h3 class="portfolio__title">Site vitrine musée d'histoire naturelle</h3>
                                 <p class="portfolio__description">Flat Design et responsive avec charte graphique personnalisée</p>
                                 <a href="http://naturalis-massilia.alwaysdata.net" target="_blank" class="button button--flex button--small portfolio__button">
                                     Demo
                                     <i class="uil uil-arrow-right button__icon"></i>
                                 </a>
                             </div>
                         </div>
                         <!--==================== PORTFOLIO 2 ====================-->
                         <div class="portfolio__content grid swiper-slide">
                            <img src="assets/img/portfolio2.png" alt="" class="portfolio__img">

                            <div class="portfolio__data">
                                <h3 class="portfolio__title">Site E-Commerce</h3>
                                <p class="portfolio__description">Produits pour particulier et Services pour professionnels</p>
                                <a href="https://eco-service.pac.center" target="_blank" class="button button--flex button--small portfolio__button">
                                    Demo
                                    <i class="uil uil-arrow-right button__icon"></i>
                                </a>
                            </div>
                        </div>
                        <!--==================== PORTFOLIO 3 ====================-->
                         <div class="portfolio__content grid swiper-slide">
                            <img src="assets/img/portfolio3.png" alt="" class="portfolio__img">

                            <div class="portfolio__data">
                                <h3 class="portfolio__title">Site vitrine mascotte Institut G4</h3>
                                <p class="portfolio__description">Création de charte graphique + site web pour une mascotte de l'Institut G4</p>
                                <a href="https://site-cdp.vercel.app/" target="_blank" class="button button--flex button--small portfolio__button">
                                    Demo
                                    <i class="uil uil-arrow-right button__icon"></i>
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- Add Arrows -->
                    <div class="swiper-button-next">
                        <i class="uil uil-angle-right-b swiper-portfolio-icon"></i>
                    </div>
                    <div class="swiper-button-prev">
                        <i class="uil uil-angle-left-b swiper-portfolio-icon"></i>
                    </div>

                    <!-- Add Pagination -->
                    <div class="swiper-pagination"></div>
                </div>
            </section>

            <!--==================== PROJECT IN MIND ====================-->
            <section class="project section">
                <div class="project__bg">
                    <div class="project__container container grid">
                        <div class="project__date">
                            <h2 class="project__title">Vous avez un nouveau projet ?</h2>
                            <a href="#contact" class="button button--flex button--white contact__button">
                                Contactez-moi
                                <i class="uil uil-message project__icon button__icon"></i>
                            </a>
                        </div>

                        <img src="assets/img/project2.png" alt="" class="project__img">
                    </div>
                </div>
            </section>

            <!--==================== TESTIMONIAL ====================-->
            <section class="testimonial section">
                <h2 class="section__title">Témoignages</h2>
                <span class="section__subtitle">Commentaires de mes clients</span>

                <div class="testimonial__container container swiper-container">
                    <div class="swiper-wrapper">
                        <!--==================== TESTIMONIAL 1 ====================-->
                        <div class="testimonial__content swiper-slide">
                            <div class="testimonial__data">
                                <div class="testimonial__header">
                                    
                                    <div>
                                        <h3 class="testimonial__name">Philippe Mora</h3>
                                        <span class="testimonial__client">Client</span>
                                    </div>
                                </div>

                                <div>
                                    <i class="uil uil-star testimonial__icon-star"></i>
                                    <i class="uil uil-star testimonial__icon-star"></i>
                                    <i class="uil uil-star testimonial__icon-star"></i>
                                    <i class="uil uil-star testimonial__icon-star"></i>
                                    <i class="uil uil-star testimonial__icon-star"></i>
                                </div>
                            </div>

                            <p class="testimonial__description">Trés bon projet, tout est cohérent, 
                                la relation avec le client a bien été respecté.
                            </p>
                        </div>
                        <!--==================== TESTIMONIAL 2 ====================-->
                        <div class="testimonial__content swiper-slide">
                            <div class="testimonial__data">
                                <div class="testimonial__header">
                                    
                                    <div>
                                        <h3 class="testimonial__name">Philippe Mora</h3>
                                        <span class="testimonial__client">Client</span>
                                    </div>
                                </div>

                                <div>
                                    <i class="uil uil-star testimonial__icon-star"></i>
                                    <i class="uil uil-star testimonial__icon-star"></i>
                                    <i class="uil uil-star testimonial__icon-star"></i>
                                    <i class="uil uil-star testimonial__icon-star"></i>
                                    <i class="uil uil-star testimonial__icon-star"></i>
                                </div>
                            </div>

                            <p class="testimonial__description">Très bon projet, les livrables sont biens construits et utilisables (surtout les Specs)
                            </p>
                        </div>
                    </div>

                    <!-- Add Pagination -->
                    <div class="swiper-pagination swiper-pagination-testimonial"></div>
                </div>
            </section>

            <!--==================== CONTACT ME ====================-->

            <?php
            if(isset($_POST['mailform'])) {

               if(!empty($_POST['nom']) AND !empty($_POST['mail']) AND !empty($_POST['project']) AND !empty($_POST['message'])) {
                  $header="MIME-Version: 1.0\r\n";
                  $header.='From:"Loris Esteve"<esteveloris@gmail.com>'."\n";
                  $header.='Content-Type:text/html; charset="uft-8"'."\n";
                  $header.='Content-Transfer-Encoding: 8bit';
                  $message='
                  <html>
                     <body>
                           Nom : '.$_POST['nom'].'<br />
                           Adresse mail  : '.$_POST['mail'].'<br />
                           Sujet  : '.$_POST['subject'].'<br />
                           Message  : '.nl2br($_POST['message']).'
                     </body>
                  </html>
                  ';
                  mail("esteveloris@gmail.com", "Demande de contact", $message, $header);
                  $msg="Votre message a bien été envoyé !";
               } else {
                  $msg="Veuillez completer tous les champs.";
               }
            }

            ?>

            <section class="contact section" id="contact">
                <h2 class="section__title">Contactez-moi</h2>
                <span class="section__subtitle">Entrons en contact</span>

                <div class="contact__message">
                        <?php if(isset($msg)) {
                        echo $msg;
                        }
                        ?>
                    </div>

                <div class="contact__container container grid">
                    <div>
                        <div class="contact__information">
                            <i class="uil uil-phone contact__icon"></i>

                            <div>
                                <h3 class="contact__title">Par téléphone</h3>
                                <a href ="tel:+33-6-76-17-63-72" class="contact__subtitle">06 76 17 63 72</a>
                            </div>
                        </div>
                        <div class="contact__information">
                            <i class="uil uil-envelope contact__icon"></i>

                            <div>
                                <h3 class="contact__title">Par e-mail</h3>
                                <a href="mailto:esteveloris@gmail.com" class="contact__subtitle">esteveloris@gmail.com</a>
                            </div>
                        </div>
                        <div class="contact__information">
                            <i class="uil uil-map-marker contact__icon"></i>

                            <div>
                                <h3 class="contact__title">Localisation</h3>
                                <span class="contact__subtitle">23 Rue Mathieu Stilatti<br/>13003 Marseille, France</span>
                            </div>
                        </div>
                    </div>

                    <form method="POST" action="#contact" class="contact__form grid">
                         <div class="contact__inputs grid">
                            <div class="contact__content">
                                <label for="" class="contact__label">Nom</label>
                                <input type="text" name="nom" class="contact__input" placeholder="Entrez votre nom" value="<?php if(isset($_POST['nom'])) { echo $_POST['nom']; } ?>" /><br /><br />
                         </div>
                             <div class="contact__content">
                                <label for="" class="contact__label">Email</label>
                                <input type="email" name="mail" class="contact__input" placeholder="Entrez votre adresse mail" value="<?php if(isset($_POST['mail'])) { echo $_POST['mail']; } ?>" /><br /><br />
                             </div>
                             <div class="contact__content">
                                <label for="" class="contact__label">Sujet</label>
                                <input type="text" name="subject" class="contact__input" placeholder="Entrez le sujet de votre message" value="<?php if(isset($_POST['project'])) { echo $_POST['project']; } ?>" /><br /><br />
                             </div>
                             <div class="contact__content">
                                <label for="" class="contact__label">Message</label>
                                <textarea name="message" cols="0" rows="7" class="contact__input" placeholder="Entrez votre message"><?php if(isset($_POST['message'])) { echo $_POST['message']; } ?></textarea><br /><br />
                             </div>
                                <input type="submit" value="Envoyer" name="mailform" class="button button--flex contact__button"/>
                            </div>
                        </div>
                    </form>

                </div>
            </section>
        </main>

        <!--==================== FOOTER ====================-->
        <footer class="footer">
            <div class="footer__bg">
                <div class="footer__container container grid">
                    <div>
                        <h1 class="footer__title">Loris</h1>
                        <span class="footer__subtitle">Développeur Front-End</span><br/><br/>
                        <a href="#home" class="nav__logo"><img class="nav__logo" width="60" src="assets/img/logo-white.png"></a>
                    </div>

                    <ul class="footer__links">
                        <li>
                            <a href="#services" class="footer__link">Services</a>
                        </li>
                        <li>
                            <a href="#portfolio" class="footer__link">Portfolio</a>
                        </li>
                        <li>
                            <a href="#contact" class="footer__link">Contact</a>
                        </li>
                    </ul>

                    <div class="footer__socials">
                        <a href="https://www.linkedin.com/in/profil-loris-esteve/" target="_blank" class="footer__social">
                            <i class="uil uil-linkedin"></i>
                        </a>
                         <a href="https://github.com" target="_blank" class="footer__social">
                            <i class="uil uil-github-alt"></i>
                        </a>
                    </div>
                </div>

                <p class="footer__copy">&#169; Loris Esteve. Tous droits réservés</p>
            </div>
        </footer>
        
        <!--==================== SCROLL TOP ====================-->
        <a href="#" class="scrollup" id="scroll-up">
            <i class="uil uil-arrow-up scrollup__icon"></i>
        </a>

        <!--==================== SWIPER JS ====================-->
        <script src="assets/js/swiper-bundle.min.js"></script>

        <!--==================== MAIN JS ====================-->
        <script src="assets/js/main.js"></script>
    </body>
</html>