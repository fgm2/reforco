// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require cocoon
//= require jquery-ui
//= require turbolinks
//= require_tree .

// usado para image slide na pagina inicial
//= require owl.carousel

$(document).ready(function() {
    $(".owl-carousel").owlCarousel({
        autoPlay: true,
        slideSpeed : 300,
        paginationSpeed : 400,
        paginationNumbers: true,
        singleItem:true   
    });
    
    
     $(function() {

$('#btnentrar').click(function(event) {
    $('#modal1').addClass("logmod");
    $('#modal2').addClass("logmod__wrapper");
    $('.logmod__container').removeClass("rf-hide"); 
    $('.logmod__close').focusin();
	event.preventDefault();

		$('.logmod').dialog({					
			width: 600,
            heigth: 600,
			modal: true,
			closeOnEscape: true,
			dialogClass: ".rf-hide",
			fadeIn: true,
            //   buttons: [
            //     { click: function() {
            //           event.preventDefault();
            //     $('#modal1').removeClass("logmod");
            //     $('#modal2').removeClass("logmod__wrapper");
            //     $('.logmod__container').addClass("rf-hide"); 
            //         $( this ).dialog( "close" );
            //       }
            //     }
            //   ]
			close: function(event, ui) {
			    event.preventDefault();
                $('#modal1').removeClass("logmod");
                $('#modal2').removeClass("logmod__wrapper");
                $('.logmod__container').addClass("rf-hide"); 
                $('.logmod').dialog('close');
				}
			});
			
		$(window).bind('keyup',function(e){
            if(e.keyCode == 27) {
                $('.logmod').dialog('close');
                $('.logmod__container').fadeOut();
            }
        })
    }); //close click
});
    
    
});
