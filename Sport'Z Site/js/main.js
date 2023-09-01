$(function($) {

  "use strict";

  /*=========================== preloader ===========================*/
  // Wait for window load
  $(window).on('load', function() {
     $(".se-pre-con").fadeOut("slow");;
  });

/*=========================== active menu ===========================*/

 $('#mobile-menu').meanmenu({
        meanMenuContainer: '.mobile-menu',
        meanScreenWidth: "994",
        meanMenuClose: '<span class="close-icon"></span><span class="close-icon"></span><span class="close-icon"></span>',
        meanMenuCloseSize: "24",
    });

  $(window).scroll(function(){

    var wScroll = $(this).scrollTop();

    // Activate menu
    if (wScroll >0) {
      $('.header-logo-menu').addClass('active_sc');
    }
    else {
      $('.header-logo-menu').removeClass('active_sc');
    };
        
  });

  $('#main_nav_id').onePageNav();

/*=========================== active menu ===========================*/


  //mouse over image drag
  $('html').mousemove(function(e){
    
    var wx = $(window).width();
    var wy = $(window).height();
    
    var x = e.pageX - this.offsetLeft;
    var y = e.pageY - this.offsetTop;
    
    var newx = x - wx/2;
    var newy = y - wy/2;
    

    
    $('#wrapper div').each(function(){
      var speed = $(this).attr('data-speed');
      if($(this).attr('data-revert')) speed *= -1;
      TweenMax.to($(this), 1, {x: (1 - newx*speed), y: (1 - newy*speed)});
      
    });
    
  });

/*=========================== client logo ===========================*/
var owls = $("#logo_slider_owl");
    owls.owlCarousel({

        autoplay: true,
        autoplayTimeout:6000,
        smartSpeed:1000,
        autoplayHoverPause:true,
        items: 6,
        loop: true,
        center: false,
        margin: 30,
        stagePadding: 0,
        dots:false,
        nav:false,

        merge: false,
        mergeFit: true,
        autoWidth: false,
        responsiveClass: true,
        responsive: {
            0: {
                items: 1,
            },
            580: {
                items: 1,
            },
            767: {
                items: 3,
                nav: false
            },
            994: {
                items: 4,
                nav: false,
                loop: true
            }
        }
  });


/*=========================== testimonials ===========================*/
var owls = $("#testimonial_slider_owl");
    owls.owlCarousel({
      smartSpeed:1400,
        stagePadding: 200,
        loop:true,
        margin:30,
        nav:false,
        items:1,
        lazyLoad: true,
        nav:false,
        dots:true,
      responsive:{
            0:{
                items:1,
                stagePadding: 0
            },
            480:{
                items:1,
                stagePadding: 0
            },
            600:{
                items:1,
                stagePadding: 100
            },
            1000:{
                items:1,
                stagePadding: 200
            },
            1200:{
                items:1,
                stagePadding: 250
            },
            1400:{
                items:1,
                stagePadding: 280
            },
            1600:{
                items:1,
                stagePadding: 280
            },
            1800:{
                items:1,
                stagePadding: 400
            }
          }
  });


/*=========================== testimonials ===========================*/
var owls = $("#testimonial_slider_owl2");
    owls.owlCarousel({
      smartSpeed:1400,
        stagePadding: 0,
        loop:true,
        margin:0,
        nav:false,
        items:1,
        lazyLoad: true,
        nav:false,
        dots:true,
  });

/*=========================== screenshots ===========================*/
var owls = $("#screenshot_owl_2");
    owls.owlCarousel({
        autoplay:true,
        autoplayTimeout:6000,
        smartSpeed:1000,
        stagePadding: 0,
        loop:true,
        nav:false,
        items:3,
        lazyLoad: true,
        center: true,
        nav:true,
        dots:false,
        margin:80,
        navText : ["<i class='fas fa-long-arrow-alt-left '></i>","<i class='fas fa-long-arrow-alt-right '></i>"],
        responsive:{
              0:{
                  items:1,
              },
              480:{
                  items:1,
              },
              600:{
                  items:2,
              },
              1000:{
                  items:3,
                  margin:30,
              },
              1200:{
                  items:5,
              }
        }
  });


/*=========================== Pricing tabs===========================*/


// Price Table
  var monthly_price_table = $('#price_tables').find('.monthly');
  var yearly_price_table = $('#price_tables').find('.yearly');


  $('.switch-toggles').find('.monthly').addClass('active');
  $('#price_tables').find('.monthly').addClass('active');

  $('.switch-toggles').find('.monthly').on('click', function(){
    $(this).addClass('active');
    $(this).closest('.switch-toggles').removeClass('active');
    $(this).siblings().removeClass('active');
    monthly_price_table.addClass('active');
    yearly_price_table.removeClass('active');
  });

  $('.switch-toggles').find('.yearly').on('click', function(){
    $(this).addClass('active');
    $(this).closest('.switch-toggles').addClass('active');
    $(this).siblings().removeClass('active');
    yearly_price_table.addClass('active');
    monthly_price_table.removeClass('active');     
  });


 /*=========================== popup image ===========================*/

//popup gallery
  $('.popup-gallery').magnificPopup({
      delegate: 'a',
      type: 'image',
      tLoading: 'Loading image #%curr%...',
      mainClass: 'mfp-img-mobile',
      gallery: {
          enabled: true,
          navigateByImgClick: true,
          preload: [0, 1] // Will preload 0 - before current, and 1 after the current image
      }
  });

 /*=========================== video popup image ===========================*/
$('.popup-youtube').magnificPopup({
  type: 'iframe',
  
  iframe: {
     markup: '<div class="mfp-iframe-scaler">'+
                '<div class="mfp-close"></div>'+
                '<iframe class="mfp-iframe" frameborder="0" allowfullscreen></iframe>'+
                +
              '</div>'
  },

  
});



/*=========================== counter js active ===========================*/

    $('.counter').counterUp({
        delay: 4,
        time: 4000
    });

/*=========================== close counter js active ===========================*/




});

 // ------------------------------- AOS Animation 
// wow = new WOW(
//       {
//       boxClass:     'wow',      // default
//       animateClass: 'animated', // default
//       offset:       0,          // default
//       mobile:       false,       // default
//       live:         true,        // default
//       offset: 30,
//     }
//     )
//  wow.init();
