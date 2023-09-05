<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
    <link rel="stylesheet" href="assets/css/swiper-bundle.min.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="icon" type="image/png" href="assets/img/logo.png">
    <title>Portfolio Loris Esteve</title>
</head>

<body>

    <header class="header" id="header">
        <nav class="nav container">
            <a href="#" class="nav__logo"><img class="nav__logo" width="40" src="assets/img/logo.png"></a>

            <div class="nav__menu" id="nav-menu">
                <ul class="nav__list grid">
                    <li class="nav__item">
                        <a href="#about" class="nav__link active-link">
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
                <i class="uil uil-moon change-theme" id="theme-button"></i>

                <div class="nav__toggle" id="nav-toggle">
                    <i class="uil uil-apps"></i>
                </div>
            </div>
        </nav>
    </header>

    <main class="main">
        <section class="about section" id="about">
            <h2 class="section__title">À propos de moi</h2>
            <span class="section__subtitle">Développeur Web - Webdesigner</span>

            <div class="about__container container grid">
                <img src="assets/img/about2.png" alt="" class="about__img">

                <div class="about_data">
                    <p class="about__description">Animé par le goût du challenge, j'aime me lancer des défis et sortir de ma zone de confort.<br>Mon esprit d'équipe, mon aisance relationnelle et mes bonnes capacités d'adaptation font de moi quelqu'un qui valorise le partage et la communication.<br><br>Passionné par l'informatique depuis mon enfance, j'ai toujours aspiré à exercer un métier dans ce secteur.<br>Les nouvelles technologies et l'informatique en général suscitent en moi une réelle passion. En plus du goût du challenge et de l'aptitude à sortir de ma zone de confort, j'aime apprendre de manière autonome de nouvelles technologies et de nouveaux logiciels.<br>L'esprit d'équipe, le partage et la communication revêtent une importance capitale à mes yeux.<br><br>Disponible dès le 18 Octobre.<br>Mon parcours et mes caractéristiques font de moi un candidat désireux d'intégrer un environnement stimulant où je pourrais contribuer tout en continuant à me développer.</p>
                    <div class="about__info">
                        <div class="about__card">
                            <span class="about__info-title">4 ans</span>
                            <span class="about__info-name">d'experience professionnelle</span>
                        </div>
                        <div class="about__card">
                            <span class="about__info-title">De nombreux</span>
                            <span class="about__info-name">languages et logiciels <br /> maîtrisés</span>
                        </div>
                        <div class="about__card">
                            <span class="about__info-title">Bac +5</span>
                        </div>
                    </div>
                </div>

                <div class="about__buttons">
                    <a href="assets/pdf/ESTEVE Loris CV.pdf" target="_blank" class="button button--flex cv__button">
                        Voir mon CV<i class="uil uil-download-alt button__icon"></i>
                    </a>
                    <a href="#contact" class="button button--flex contact__first__button">
                        Contactez-moi <i class="uil uil-message button__icon"></i>
                    </a>
                </div>
            </div>
        </section>

        <section class="skills section" id="skills">
            <h2 class="section__title">Compétences techniques</h2>
            <span class="section__subtitle">Hard skills</span>

            <div class="skills__container container">
                <div>
                    <div class="skills__content skills__open">
                        <div class="skills__header">
                            <i class="uil uil-brackets-curly skills__icon"></i>

                            <div>
                                <h1 class="skills__titles">Front-End</h1>
                            </div>

                            <i class="uil uil-angle-down skills__arrow"></i>
                        </div>

                        <div class="skills__list grid">

                            <div class="skills__container__list">
                                <div class="skills__img">
                                    <img src="assets/img/html.svg" />
                                </div>
                                <div class="skills__data">
                                    <div class="skills__titles">
                                        <h3 class="skills__name">HTML</h3>
                                        <span class="skills__number">90%</span>
                                    </div>
                                    <div class="skills__bar">
                                        <span class="skills__percentage skills__html"></span>
                                    </div>
                                </div>
                            </div>

                            <div class="skills__container__list">
                                <div class="skills__img">
                                    <img src="assets/img/css.svg" />
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
                            </div>

                            <div class="skills__container__list">
                                <div class="skills__img">
                                    <img src="assets/img/js.svg" />
                                </div>
                                <div class="skills__data">
                                    <div class="skills__titles">
                                        <h3 class="skills__name">JavaScript</h3>
                                        <span class="skills__number">60%</span>
                                    </div>
                                    <div class="skills__bar">
                                        <span class="skills__percentage skills__js"></span>
                                    </div>
                                </div>
                            </div>

                            <div class="skills__container__list">
                                <div class="skills__img">
                                    <img src="assets/img/reactjs.svg" />
                                </div>
                                <div class="skills__data">
                                    <div class="skills__titles">
                                        <h3 class="skills__name">ReactJS</h3>
                                        <span class="skills__number">80%</span>
                                    </div>
                                    <div class="skills__bar">
                                        <span class="skills__percentage skills__reactjs"></span>
                                    </div>
                                </div>
                            </div>

                            <div class="skills__container__list">
                                <div class="skills__img">
                                    <img src="assets/img/vuejs.svg" />
                                </div>
                                <div class="skills__data">
                                    <div class="skills__titles">
                                        <h3 class="skills__name">VueJS</h3>
                                        <span class="skills__number">70%</span>
                                    </div>
                                    <div class="skills__bar">
                                        <span class="skills__percentage skills__vuejs"></span>
                                    </div>
                                </div>
                            </div>

                            <div class="skills__container__list">
                                <div class="skills__img">
                                    <img src="assets/img/flutter.svg" />
                                    <img src="assets/img/dart.svg" />
                                </div>
                                <div class="skills__data">
                                    <div class="skills__titles">
                                        <h3 class="skills__name">Flutter / Dart</h3>
                                        <span class="skills__number">70%</span>
                                    </div>
                                    <div class="skills__bar">
                                        <span class="skills__percentage skills__flutter"></span>
                                    </div>
                                </div>
                            </div>

                            <div class="skills__container__list">
                                <div class="skills__img">
                                    <img src="assets/img/wordpress.svg" />
                                    <img src="assets/img/elementor.svg" />
                                </div>
                                <div class="skills__data">
                                    <div class="skills__titles">
                                        <h3 class="skills__name">WordPress / Elementor</h3>
                                        <span class="skills__number">80%</span>
                                    </div>
                                    <div class="skills__bar">
                                        <span class="skills__percentage skills__wordpress"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="skills__content skills__close">
                        <div class="skills__header">
                            <i class="uil uil-server-network skills__icon"></i>

                            <div>
                                <h1 class="skills__titles">Back-End</h1>
                            </div>

                            <i class="uil uil-angle-down skills__arrow"></i>
                        </div>

                        <div class="skills__list grid">
                            <div class="skills__container__list">
                                <div class="skills__img">
                                    <img src="assets/img/php.svg" />
                                </div>
                                <div class="skills__data">
                                    <div class="skills__titles">
                                        <h3 class="skills__name">PHP</h3>
                                        <span class="skills__number">60%</span>
                                    </div>
                                    <div class="skills__bar">
                                        <span class="skills__percentage skills__php"></span>
                                    </div>
                                </div>
                            </div>

                            <div class="skills__container__list">
                                <div class="skills__img">
                                    <img src="assets/img/mysql.svg" />
                                </div>
                                <div class="skills__data">
                                    <div class="skills__titles">
                                        <h3 class="skills__name">MySQL</h3>
                                        <span class="skills__number">60%</span>
                                    </div>
                                    <div class="skills__bar">
                                        <span class="skills__percentage skills__mysql"></span>
                                    </div>
                                </div>
                            </div>

                            <div class="skills__container__list">
                                <div class="skills__img">
                                    <img src="assets/img/python.svg" />
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
                        <div class="skills__content skills__close">
                            <div class="skills__header">
                                <i class="uil uil-palette skills__icon"></i>

                                <div>
                                    <h1 class="skills__titles">Design Graphique</h1>
                                </div>

                                <i class="uil uil-angle-down skills__arrow"></i>
                            </div>

                            <div class="skills__list grid">
                                <div class="skills__container__list">
                                    <div class="skills__img">
                                        <img src="assets/img/photoshop.svg" />
                                    </div>
                                    <div class="skills__data">
                                        <div class="skills__titles">
                                            <h3 class="skills__name">Photoshop</h3>
                                            <span class="skills__number">60%</span>
                                        </div>
                                        <div class="skills__bar">
                                            <span class="skills__percentage skills__photoshop"></span>
                                        </div>
                                    </div>
                                </div>

                                <div class="skills__container__list">
                                    <div class="skills__img">
                                        <img src="assets/img/illustrator.svg" />
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
                                </div>

                                <div class="skills__container__list">
                                    <div class="skills__img">
                                        <img src="assets/img/xd.svg" />
                                    </div>
                                    <div class="skills__data">
                                        <div class="skills__titles">
                                            <h3 class="skills__name">Adobe XD</h3>
                                            <span class="skills__number">50%</span>
                                        </div>
                                        <div class="skills__bar">
                                            <span class="skills__percentage skills__xd"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <h2 class="section__title">Compétences générales</h2>
            <span class="section__subtitle">Soft skills</span>

            <div class="skills_container container">
                <div>
                    <div class="skills__content skills__close">
                        <div class="skills__header">
                            <i class="uil uil-user skills__icon"></i>

                            <div>
                                <h1 class="skills__titles">Moi</h1>
                            </div>

                            <i class="uil uil-angle-down skills__arrow"></i>
                        </div>

                        <div class="skills__list grid" id="myself">
                            <div class="skills__container__list">
                                <div class="skills__img">
                                    <img src="assets/img/autonomous.png" />
                                </div>
                                <div class="skills__data">
                                    <div class="skills__titles">
                                        <h3 class="skills__name">Autonomie</h3>
                                        <span class="skills__number">90%</span>
                                    </div>
                                    <div class="skills__bar">
                                        <span class="skills__percentage skills__autonomy"></span>
                                    </div>
                                </div>
                            </div>

                            <div class="skills__container__list">
                                <div class="skills__img">
                                    <img src="assets/img/flexible.png" />
                                </div>
                                <div class="skills__data">
                                    <div class="skills__titles">
                                        <h3 class="skills__name">Capacité d'adaptation / flexibilité</h3>
                                        <span class="skills__number">100%</span>
                                    </div>
                                    <div class="skills__bar">
                                        <span class="skills__percentage skills__adaptability"></span>
                                    </div>
                                </div>
                            </div>

                            <div class="skills__container__list">
                                <div class="skills__img">
                                    <img src="assets/img/creativity.png" />
                                </div>
                                <div class="skills__data">
                                    <div class="skills__titles">
                                        <h3 class="skills__name">Créativité</h3>
                                        <span class="skills__number">70%</span>
                                    </div>
                                    <div class="skills__bar">
                                        <span class="skills__percentage skills__creativity"></span>
                                    </div>
                                </div>
                            </div>

                            <div class="skills__container__list">
                                <div class="skills__img">
                                    <img src="assets/img/management.png" />
                                </div>
                                <div class="skills__data">
                                    <div class="skills__titles">
                                        <h3 class="skills__name">Management</h3>
                                        <span class="skills__number">50%</span>
                                    </div>
                                    <div class="skills__bar">
                                        <span class="skills__percentage skills__management"></span>
                                    </div>
                                </div>
                            </div>

                            <div class="skills__container__list">
                                <div class="skills__img">
                                    <img src="assets/img/team-spirit.png" />
                                </div>
                                <div class="skills__data">
                                    <div class="skills__titles">
                                        <h3 class="skills__name">Esprit d’équipe</h3>
                                        <span class="skills__number">100%</span>
                                    </div>
                                    <div class="skills__bar">
                                        <span class="skills__percentage skills__team-spirit"></span>
                                    </div>
                                </div>
                            </div>

                            <div class="skills__container__list">
                                <div class="skills__img">
                                    <img src="assets/img/decision-making.png" />
                                </div>
                                <div class="skills__data">
                                    <div class="skills__titles">
                                        <h3 class="skills__name">Prise de décision</h3>
                                        <span class="skills__number">50%</span>
                                    </div>
                                    <div class="skills__bar">
                                        <span class="skills__percentage skills__decision-making"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="qualification section" id="qualifications">
            <h2 class="section__title">Parcours personnel</h2>
            <span class="section__subtitle">Parcours scolaire et professionnel</span>

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
                    <div class="qualification__content qualification__active" data-content id="education">
                        <div class="qualification__data">
                            <div class="qualification__card">
                                <h3 class="qualification__title">Titre RNCP 7 | Concepteur et développeur d'application - Chef de projet systèmes d'information - Numérique & Management</h3>
                                <span class="qualification__subtitle">
                                    <br />
                                    <ul>
                                        <li>Projet de groupe sur la création de site web vitrine et e-commerce et d'un back office pour le club de basket de Salon-de-Provence PSB13 en CakePHP et ReactJS pour un vrai client (Développeur)<br />Dans ce projet j'ai également eu l'occasion de gérer pendant une semaine une équipe de 4 développeurs de l'Institut G4 en première année</li>
                                        <li>Projet de groupe sur la création d'une application sportive de rencontre en Flutter (Développeur)</li>
                                        <li>Projet de groupe sur la création d'une mascotte pour l'Institut G4 (Développeur)</li>
                                        <li>Projet de groupe sur la création d'un site vitrine pour un musée fictif de marseille (Développeur + Designer (charte graphique))</li>
                                    </ul>
                                    <br />
                                    Institut G4, Marseille
                                </span>
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
                        <div class="qualification__data">
                            <div></div>

                            <div>
                                <span class="qualification__rounder"></span>
                                <span class="qualification__line"></span>
                            </div>

                            <div class="qualification__card">
                                <h3 class="qualification__title">Brevet de Technicien Supérieur Systèmes Numériques option Informatique et Réseaux</h3>
                                <span class="qualification__subtitle">
                                    <br />
                                    <ul>
                                        <li>Projet de groupe sur une station météo en C++ (Client et serveur TCP, récupèration et affichage de données dans un logiciel, micro base de données)</li>
                                        <li>Création d'interfaces homme-machine avec QT Creator connectées avec des capteurs, leds</li>
                                    </ul>
                                    <br />
                                    Avis très favorable, Tableau d'honneur
                                    <br />
                                    Lycée Jean Perrin, Marseille
                                </span>
                                <div class="qualification__calendar">
                                    <i class="uil uil-calendar-alt"></i>
                                    2018 - 2020
                                </div>
                            </div>
                        </div>
                        <div class="qualification__data">
                            <div class="qualification__card">
                                <h3 class="qualification__title">Baccalauréat Sciences et Technologies du Développement Durable option Energie Environnement – Mention Assez Bien</h3>
                                <span class="qualification__subtitle">
                                    <br />
                                    <ul>
                                        <li>Projet de groupe sur une serre autonome</li>
                                        <li>Programmation sur Arduino (capteurs de température, d'humidité)</li>
                                    </ul>
                                    <br />
                                    Lycée Les Iscles, Manosque
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
                    <div class="qualification__content" data-content id="work">
                        <div class="qualification__data">
                            <div class="qualification__card">
                                <h3 class="qualification__title">Alternance - Développeur Front-End </h3>
                                <span class="qualification__subtitle">
                                    <br />
                                    <ul>
                                        <li>Création et maintenance de sites web vitrines avec WordPress (<a href="https://pbsformation.fr" target="_blank">pbsformation.fr</a> et <a href="https://d-learning.fr" target="_blank">d-learning.fr</a>)</li>
                                        <li>Création d'un outil de création de sites web avec Gatsby en React et Python</li>
                                        <li>Création de plateforme de formations e-learning sur WordPress avec le plugin LMS LearnDash</li>
                                        <li>Création d'un CRM sur mesure pour la gestion de stagiaires</li>
                                        <li>Création de plugins WordPress pour la création personnalisée de templates de mail</li>
                                    </ul>
                                    <br />
                                    Tekzone, Marseille
                                    <div class="qualification__calendar">
                                        <i class="uil uil-calendar-alt"></i>
                                        2020 - 2021
                                    </div>
                                    Professional Business School, Marseille
                                    <div class="qualification__calendar">
                                        <i class="uil uil-calendar-alt"></i>
                                        2021 - 2023
                                    </div>
                                </span>
                            </div>

                            <div>
                                <span class="qualification__rounder"></span>
                                <span class="qualification__line"></span>
                            </div>
                        </div>
                        <div class="qualification__data">
                            <div></div>

                            <div>
                                <span class="qualification__rounder"></span>
                                <span class="qualification__line"></span>
                            </div>
                            <div class="qualification__card">
                                <h3 class="qualification__title">Stage en informatique</h3>
                                <span class="qualification__subtitle">
                                    <br />
                                    <ul>
                                        <li>Création de serveurs virtuels sur VMWare avec Windows Server 2016</li>
                                        <li>Installation et configuration des rôles DHCP et DNS pour le partage de fichiers et de données</li>
                                        <li>Administration Réseau (création de sessions étudiantes Windows avec des droits limités)
                                            Surveillance de ressources avec Kaseya, logiciel de monitoring (Utilisation processeur, RAM, Disque Dur ...)</li>
                                    </ul>
                                    <br />
                                    OPTIMAL.SI, Manosque
                                </span>
                                <div class="qualification__calendar">
                                    <i class="uil uil-calendar-alt"></i>
                                    2019 (6 semaines)
                                </div>
                            </div>
                        </div>
                        <div class="qualification__data">
                            <div class="qualification__card">
                                <h3 class="qualification__title">Employé de rayon</h3>
                                <span class="qualification__subtitle">
                                    <br />
                                    <ul>
                                        <li>Mise en rayons de différents produits</li>
                                    </ul>
                                    <br />
                                    Casino, Forcalquier
                                </span>
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
                        <div class="qualification__data">
                            <div></div>

                            <div>
                                <span class="qualification__rounder"></span>
                            </div>
                            <div class="qualification__card">
                                <h3 class="qualification__title">Stage d'observation</h3>
                                <span class="qualification__subtitle">
                                    <br />
                                    <ul>
                                        <li>Observation sur les postes informatiques, logiciels utilisés propres à l'entreprise (Pesée de poids lourds avec bennes à recycler, enregistrements base de données (nom, prénom, adresse, ville, poids du camion)</li>
                                    </ul>
                                    <br />
                                    CMR Recyclage, La Brillanne
                                </span>
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

        <section class="services section" id="services">
            <h2 class="section__title">Services</h2>
            <span class="section__subtitle">Ce que je propose</span>

            <div class="services__container container grid">

                <div class="services__content">
                    <div>
                        <i class="uil uil-brackets-curly services__icon"></i>
                        <h3 class="services__title">Développement <br /> Front-End</h3>
                    </div>

                    <span class="button button--flex button--small button--link services__button">
                        Voir plus
                        <i class="uil uil-arrow-right button__icon"></i>
                    </span>

                    <div class="services__modal">
                        <div class="services__modal-content">
                            <h4 class="services__modal-title">Développement Front-End</h4>
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
                                </li>
                                <li class="services__modal-service">
                                    <i class="uil uil-mobile-android services__modal-icon"></i>
                                    <p>Application mobile</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="services__content">
                    <div>
                        <i class="uil uil-server-network services__icon"></i>
                        <h3 class="services__title">Développement <br /> Back-End</h3>
                    </div>

                    <span class="button button--flex button--small button--link services__button">
                        Voir plus
                        <i class="uil uil-arrow-right button__icon"></i>
                    </span>

                    <div class="services__modal">
                        <div class="services__modal-content">
                            <h4 class="services__modal-title">Développement Back-End</h4>
                            <i class="uil uil-times services__modal-close"></i>

                            <ul class="services__modal-services grid">
                                <li class="services__modal-service">
                                    <i class="uil uil-database services__modal-icon"></i>
                                    <p>Développement d'un back office avec gestion de données (CRUD : Création, lecture, modification et suppression de données en base de données par exemple)</p>
                                </li>
                                <li class="services__modal-service">
                                    <i class="uil uil-data-sharing services__modal-icon"></i>
                                    <p>Utilisation d'API (requêtes HTTP)</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="services__content">
                    <div>
                        <i class="uil uil-palette services__icon"></i>
                        <h3 class="services__title">Ui/Ux <br /> Designer</h3>
                    </div>

                    <span class="button button--flex button--small button--link services__button">
                        Voir plus
                        <i class="uil uil-arrow-right button__icon"></i>
                    </span>

                    <div class="services__modal">
                        <div class="services__modal-content">
                            <h4 class="services__modal-title">Ui/Ux Designer</h4>
                            <i class="uil uil-times services__modal-close"></i>

                            <ul class="services__modal-services grid">
                                <li class="services__modal-service">
                                    <i class="uil uil-tear services__modal-icon"></i>
                                    <p>Création de maquettes</p>
                                </li>
                                <li class="services__modal-service">
                                    <i class="uil uil-brush-alt services__modal-icon"></i>
                                    <p>Création de logos</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
        </section>

        <section class="portfolio section" id="portfolio">
            <h2 class="section__title">Portfolio</h2>
            <span class="section__subtitle">Projets les plus récents</span>

            <div class="portfolio__container container swiper-container">
                <div class="swiper-wrapper">
                    <div class="portfolio__content grid swiper-slide">
                        <img src="assets/img/portfolio1.png" alt="" class="portfolio__img">
                        <div class="portfolio__data">
                            <h3 class="portfolio__title">Site vitrine musée d'histoire naturelle</h3>
                            <p class="portfolio__description">Flat Design et responsive avec charte graphique personnalisée</p>
                            <a href="/Naturalis Massilia" target="_blank" class="button button--flex button--small portfolio__button">
                                Demo
                                <i class="uil uil-arrow-right button__icon"></i>
                            </a>
                        </div>
                    </div>
                    <div class="portfolio__content grid swiper-slide">
                        <img src="assets/img/portfolio2.png" alt="" class="portfolio__img">

                        <div class="portfolio__data">
                            <h3 class="portfolio__title">Site Vitrine et E-Commerce</h3>
                            <p class="portfolio__description">Produits pour particulier et Services pour professionnels</p>
                            <a href="https://eco-service.pac.center" target="_blank" class="button button--flex button--small portfolio__button">
                                Demo
                                <i class="uil uil-arrow-right button__icon"></i>
                            </a>
                        </div>
                    </div>
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
                    <div class="portfolio__content grid swiper-slide">
                        <img src="assets/img/portfolio4.png" alt="" class="portfolio__img">

                        <div class="portfolio__data">
                            <h3 class="portfolio__title">Site vitrine et e-commerce du club de basket de salon PSB13</h3>
                            <p class="portfolio__description">Refonte complète du site en utilisant CakePHP et ReactJS <a href="https://www.psb13.fr/" target="_blank">psb13.fr</a></p>
                            <a href="http://dev.easyweb-g4.fr/" target="_blank" class="button button--flex button--small portfolio__button">
                                Demo
                                <i class="uil uil-arrow-right button__icon"></i>
                            </a>
                        </div>
                    </div>

                    <div class="portfolio__content grid swiper-slide">
                        <img src="assets/img/portfolio8.png" alt="" class="portfolio__img">
                        <div class="portfolio__data">
                            <h3 class="portfolio__title">Application de rencontre sportive Sport'Z</h3>
                            <p class="portfolio__description">Application de rencontre sportive en Flutter<br>Création, modification et suppression d'évènements sportfis avec géolocalisation, filtres et chat</p>
                            <a href="/Sport'Z" target="_blank" class="button button--flex button--small portfolio__button">
                                Demo
                                <i class="uil uil-arrow-right button__icon"></i>
                            </a>
                        </div>
                    </div>
                    <div class="portfolio__content grid swiper-slide">
                        <img src="assets/img/portfolio5.png" alt="" class="portfolio__img">

                        <div class="portfolio__data">
                            <h3 class="portfolio__title">Auto-Formation en HTML, CSS et JavaScript</h3>
                            <p class="portfolio__description">Classement Ligue 1, Premier League, Liga, Bundesliga, Serie A utilisant du HTML, du CSS et du JavaScript pour la récupèration des données en asynchrone</p>
                            <a href="/Formation JS" target="_blank" class="button button--flex button--small portfolio__button">
                                Demo
                                <i class="uil uil-arrow-right button__icon"></i>
                            </a>
                        </div>
                    </div>
                    <div class="portfolio__content grid swiper-slide">
                        <img src="assets/img/portfolio6.png" alt="" class="portfolio__img">

                        <div class="portfolio__data">
                            <h3 class="portfolio__title">Maintenance et mise à jour du site WordPress <a href="https://d-learning.fr" target="_blank">d-learning.fr</a></h3>
                            <p class="portfolio__description">Maintenance et mise à jour constante du site vitrine pour mettre en avant les formations disponibles sur la plateforme</p>
                            <a href="https://d-learning.fr" target="_blank" class="button button--flex button--small portfolio__button">
                                Demo
                                <i class="uil uil-arrow-right button__icon"></i>
                            </a>
                        </div>
                    </div>
                    <div class="portfolio__content grid swiper-slide">
                        <img src="assets/img/portfolio7.png" alt="" class="portfolio__img">

                        <div class="portfolio__data">
                            <h3 class="portfolio__title">Maintenance et mise à jour du site WordPress <a href="https://pbsformation.fr" target="_blank">pbsformation.fr</a></h3>
                            <p class="portfolio__description">Maintenance et mise à jour constante du site vitrine pour mettre en avant les formations disponibles sur la plateforme</p>
                            <a href="https://pbsformation.fr" target="_blank" class="button button--flex button--small portfolio__button">
                                Demo
                                <i class="uil uil-arrow-right button__icon"></i>
                            </a>
                        </div>
                    </div>
                    <div class="portfolio__content grid swiper-slide">
                        <img src="assets/img/portfolio9.png" alt="" class="portfolio__img">

                        <div class="portfolio__data">
                            <h3 class="portfolio__title">Maintenance et mise à jour du site WordPress <a href="https://tekzone.fr" target="_blank">tekzone.fr</a></h3>
                            <p class="portfolio__description">Création maintenance et mise à jour du site vitrine <a href="https://tekzone.fr" target="_blank">tekzone.fr</a></p>
                            <a href="https://tekzone.fr" target="_blank" class="button button--flex button--small portfolio__button">
                                Demo
                                <i class="uil uil-arrow-right button__icon"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="swiper-button-next">
                    <i class="uil uil-angle-right-b swiper-portfolio-icon"></i>
                </div>
                <div class="swiper-button-prev">
                    <i class="uil uil-angle-left-b swiper-portfolio-icon"></i>
                </div>

                <div class="swiper-pagination"></div>
            </div>
            <!-- Modal pour afficher l'image en grand -->
            <div id="imageModal" class="modal">
                <span class="close">&times;</span>
                <img class="modal-content" id="modalImage">
            </div>
        </section>

        <section class="project section">
            <div class="project__bg">
                <div class="project__container container grid">
                    <div class="project__date">
                        <h2 class="project__title">Vous avez un nouveau projet ?</h2>
                        <a href="#contact" class="button button--flex button--white contact__first__button">
                            Contactez-moi maintenant
                            <i class="uil uil-message project__icon button__icon"></i>
                        </a>
                    </div>
                </div>
            </div>
        </section>

        <?php
        if (isset($_POST['mailform'])) {

            if (!empty($_POST['nom']) and !empty($_POST['mail']) and !empty($_POST['subject']) and !empty($_POST['message'])) {
                $headers = "MIME-Version: 1.0" . "\r\n";
                $headers .= "Content-type: text/html; charset=UTF-8" . "\r\n";
                $headers .= "From: Loris Esteve <contact@lorisesteve.com>" . "\r\n";
                $message = '
                  <html>
                     <body>
                           Nom : ' . $_POST['nom'] . '<br />
                           Adresse mail  : ' . $_POST['mail'] . '<br />
                           Sujet  : ' . $_POST['subject'] . '<br />
                           Message  : ' . nl2br($_POST['message']) . '
                     </body>
                  </html>
                  ';
                mail("contact@lorisesteve.fr", "Demande de contact de " . $_POST['nom'], $message, $headers);
                $msg = "<span style='color: #155724;background-color: #d4edda;border-color: #c3e6cb;padding: 0.75rem 1.25rem;border-radius: 0.25rem;display: block;margin-bottom: 30px;';>Votre message a bien été envoyé !</span>";
            } else {
                $msg = "<span style='color: #721c24;background-color: #f8d7da;border-color: #f5c6cb;padding: 0.75rem 1.25rem;border-radius: 0.25rem;display: block;margin-bottom: 30px;';>Veuillez compléter tous les champs.";
            }
        }

        ?>

        <section class="contact section" id="contact">
            <h2 class="section__title">Contactez-moi</h2>
            <span class="section__subtitle">Entrons en contact</span>

            <div class="contact__container container grid">
                <div>
                    <div class="contact__information">
                        <i class="uil uil__phone contact__icon"></i>
                        <div>
                            <h3 class="contact__title">Par téléphone</h3>
                            <a href="tel:+33788836128" class="contact__subtitle">07 88 83 61 28</a>
                        </div>
                    </div>
                    <div class="contact__information">
                        <i class="uil uil__envelope contact__icon"></i>

                        <div>
                            <h3 class="contact__title">Par e-mail</h3>
                            <a href="mailto:contact@lorisesteve.fr" class="contact__subtitle">contact@lorisesteve.fr</a>
                        </div>
                    </div>
                    <div class="contact__information">
                        <i class="uil uil__map__marker contact__icon"></i>

                        <div>
                            <h3 class="contact__title">Localisation</h3>
                            <span class="contact__subtitle">04300 Forcalquier<br />13003 Marseille</span>
                        </div>
                    </div>
                </div>

                <form method="POST" action="#contact" class="contact__form">
                    <div class="contact__message">
                        <?php if (isset($msg)) {
                            echo $msg;
                        }
                        ?>
                    </div>
                    <div class="contact__inputs grid">
                        <div class="contact__content">
                            <label for="nom" class="contact__label">Nom et Prénom ou Nom d'entreprise</label>
                            <input type="text" name="nom" id="nom" class="contact__input" placeholder="Entrez votre nom prénom ou nom d'entreprise" value="<?php if (isset($_POST['nom'])) {
                                                                                                                                                                echo $_POST['nom'];
                                                                                                                                                            } ?>" />
                        </div>
                        <div class="contact__content">
                            <label for="mail" class="contact__label">Email</label>
                            <input type="email" name="mail" id="mail" class="contact__input" placeholder="Entrez votre adresse mail" value="<?php if (isset($_POST['mail'])) {
                                                                                                                                                echo $_POST['mail'];
                                                                                                                                            } ?>" />
                        </div>
                        <div class="contact__content">
                            <label for="subject" class="contact__label">Sujet</label>
                            <input type="text" name="subject" id="subject" class="contact__input" placeholder="Entrez le sujet de votre message" value="<?php if (isset($_POST['subject'])) {
                                                                                                                                                            echo $_POST['subject'];
                                                                                                                                                        } ?>" />
                        </div>
                        <div class="contact__content">
                            <label for="message" class="contact__label">Message</label>
                            <textarea name="message" id="message" cols="0" rows="7" class="contact__input" placeholder="Entrez votre message"><?php if (isset($_POST['message'])) {
                                                                                                                                                    echo $_POST['message'];
                                                                                                                                                } ?></textarea>
                        </div>
                        <button type="submit" name="mailform" class="button button--flex contact__button">
                            Envoyer <i class="uil uil-message button__icon"></i>
                        </button>
                    </div>
            </div>
            </form>

            </div>
        </section>
    </main>

    <footer class="footer">
        <div class="footer__bg">
            <div class="footer__container container grid">
                <div class="footer__left">
                    <a href="#" class="nav__logo"><img class="nav__logo" width="60" src="assets/img/logo-white.png"></a>
                    <div class="footer__right">
                        <h1 class="footer__title">Loris Esteve</h1>
                        <span class="footer__subtitle">Développeur Web - Webdesigner</span>
                    </div><br /><br />
                </div>
                <div class="footer__socials">
                    <a href="https://www.linkedin.com/in/profil-loris-esteve/" target="_blank" class="footer__social">
                        <i class="uil uil-linkedin"></i>
                    </a>
                    <a href="https://github.com/LosDaemons13/portfolio" target="_blank" class="footer__social">
                        <i class="uil uil-github-alt"></i>
                    </a>
                    <p class="footer__copy">&#169; Loris Esteve. Tous droits réservés</p>
                </div>
            </div>

        </div>
    </footer>

    <a href="#" class="scrollup" id="scroll-up">
        <i class="uil uil-arrow-up scrollup__icon"></i>
    </a>

    <script src="assets/js/swiper-bundle.min.js"></script>

    <script src="assets/js/main.js"></script>
</body>

</html>