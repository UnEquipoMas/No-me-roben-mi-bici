function openNav() {
    document.getElementById("mySidenav").style.width = "450px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}

// $(".owl-carousel").owlCarousel();

$(document).ready(function(){
  $('.owl-carousel').owlCarousel(
      {
                loop:false,
                margin:10,
                stagePadding: 50,
                nav:true,
                responsive:{
                    0:{
                        items:5
                        },
                    600:{
                        items:1
                    },
                    1000:{
                        items:3
                    }
                }
      }
      );
});



//La sección anterior corresponde a la apertura del navbar



