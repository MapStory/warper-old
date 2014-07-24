/*jslint browser: true*/
/*global $, jQuery, Modernizr, google, _gat*/
/*jshint strict: true */


/*
|--------------------------------------------------------------------------
| DOCUMENT READY
|--------------------------------------------------------------------------
*/  

$(document).ready(function() {
    "use strict";

    /*
    |--------------------------------------------------------------------------
    |  fullwidth image
    |--------------------------------------------------------------------------
    */


    if ($('#homeFullScreen').length)
    {
        fullscreenImage();
    }
    
    $(window).scroll(function() {

        if ($('#fullScreen').length)
     {
        if ($(window).scrollTop()>500){
           $('#mainHeader').slideDown();
       } else if ($(window).scrollTop()==0){
           $('#mainHeader').slideUp();
       }
   }

     });



	 /*
    |--------------------------------------------------------------------------
    |  form placeholder for IE
    |--------------------------------------------------------------------------
    */
    if(!Modernizr.input.placeholder){

        $('[placeholder]').focus(function() {
            var input = $(this);
            if (input.val() == input.attr('placeholder')) {
                input.val('');
                input.removeClass('placeholder');
            }
        }).blur(function() {
            var input = $(this);
            if (input.val() == '' || input.val() == input.attr('placeholder')) {
                input.addClass('placeholder');
                input.val(input.attr('placeholder'));
            }
        }).blur();
        $('[placeholder]').parents('form').submit(function() {
            $(this).find('[placeholder]').each(function() {
                var input = $(this);
                if (input.val() == input.attr('placeholder')) {
                    input.val('');
                }
            })
        });

    }			

    
    /*
    |--------------------------------------------------------------------------
    | TOOLTIP
    |--------------------------------------------------------------------------
    */

    $('.tips').tooltip({placement:'top'});

    
    
    /*
    |--------------------------------------------------------------------------
    | COLLAPSE
    |--------------------------------------------------------------------------
    */

    $('.accordion').on('show hide', function(e){
        $('.accordion-toggle').removeClass('active');
        $(e.target).siblings('.accordion-heading').find('.accordion-toggle').addClass('active');
        $(e.target).siblings('.accordion-heading').find('.accordion-toggle i').toggleClass('icon-plus icon-minus', 200);
        
    });

    /*
    |--------------------------------------------------------------------------
    | CONTACT
    |--------------------------------------------------------------------------
    */   
    $('.slideContact').click(function(e){

        if ( $(window).width() >= 800){

            $('#contact').slideToggle('normal', 'easeInQuad',function(){

                $('#contactinfoWrapper').css('margin-left', 0);
                $('#mapSlideWrapper').css('margin-left', 3000);
                $('#contactinfoWrapper').fadeToggle();
                

            });
            $('#closeContact').fadeToggle(); 
            return false;
            
        }else{

            return true;
            
        }
        e.preventDefault();
    });
    
    
    $('#closeContact').click(function(e){


        $('#contactinfoWrapper').fadeOut('normal', 'easeInQuad',function(){
            $('#contactinfoWrapper').css('margin-left', 0);
            $('#mapSlideWrapper').css('margin-left', 3000);
        });
        
        $('#contact').slideUp('normal', 'easeOutQuad');

        $(this).fadeOut();

        e.preventDefault();
        
    });
    



    /*
    |--------------------------------------------------------------------------
    | FLEXSLIDER
    |--------------------------------------------------------------------------
    */ 
    if($('#flexHome').length){

        $('#flexHome').flexslider({
            animation: "slide",
            controlNav:true,
            directionNav:false, 
            touch: true,
            direction: "vertical"
      
        });    
    }


    if($('.flexFullScreen').length){

        $('.flexFullScreen').flexslider({
            animation: "slide",
            controlNav: true,
            directionNav: true,
            slideshow: true,
            touch: true,
            prevText: '<i class="icon-left-open"></i>',           
            nextText: '<i class="icon-right-open"></i>',   
            start: function(slider){
                setTimeout("animateTxt("+slider.currentSlide+", 'in')", 100);  
            },
            before: function(slider){
                setTimeout("animateTxt("+slider.currentSlide+")", 100);  
            },
            after: function(slider){
                setTimeout("animateTxt("+slider.currentSlide+", 'in')", 100);  
            } 
        });

    }


    if($('.flexScreenSlider').length){

        $('.flexScreenSlider').flexslider({
            animation: "slide",
            controlNav:false,
            touch: true, 
            slideshow: true,
            prevText: '<i class="icon-left-open"></i>',           
            nextText: '<i class="icon-right-open"></i>'  
        });    
    }


    if($('.flexPortfolio').length){

        $('.flexPortfolio').flexslider({
            animation: "slide",
            controlNav:false,
            touch: true,
            slideshow: true,
            prevText: '<i class="icon-left-open"></i>',           
            nextText: '<i class="icon-right-open"></i>'  
        });    
    }


    if($('.flexProject').length){

        $('.flexProject').flexslider({
            animation: "slide",
            controlNav:true,
            touch: true,
            slideshow: true,
            prevText: '<i class="icon-left-open"></i>',           
            nextText: '<i class="icon-right-open"></i>'  
        });    
    }
	
	 if($('.flexApp').length){

        $('.flexApp').flexslider({
            animation: "slide",
            controlNav:false,
            touch: true,	
            prevText: '<i class="icon-left-open"></i>',           
            nextText: '<i class="icon-right-open"></i>'  
        });    
    }





    /*
    |--------------------------------------------------------------------------
    | MAIN ROLLOVER EFFECTS
    |--------------------------------------------------------------------------
    */     

    if($('.imgHover').length){

        $('.imgHover article').hover(
            function () {

                var $this=$(this);

                var fromTop = ($('.imgWrapper', $this).height()/2 - $('.iconLinks', $this).height()/2);
                $('.iconLinks', $this).css('margin-top',fromTop);

                $('.mediaHover', $this).height($('.imgWrapper', $this).height());   

                $('.mask', this).css('height', $('.imgWrapper', this).height());
                $('.mask', this).css('width', $('.imgWrapper', this).width());
                $('.mask', this).css('margin-top', $('.imgWrapper', this).height());


                $('.mask', this).stop(1).show().css('margin-top', $('.imgWrapper', this).height()).animate({marginTop: 0},200, function() {

                    $('.iconLinks', $this).css('display', 'block');
                    if(Modernizr.csstransitions) {
                        $('.iconLinks a').addClass('animated');


                        $('.iconLinks a', $this).removeClass('flipOutX'); 
                        $('.iconLinks a', $this).addClass('bounceInDown'); 

                    }else{

                        $('.iconLinks', $this).stop(true, false).fadeIn('fast');
                    }


                });



            },function () {

                var $this=$(this);


                $('.mask', this).stop(1).show().animate({marginTop: $('.imgWrapper', $this).height()},200, function() {

                    if(Modernizr.csstransitions) {
                        $('.iconLinks a', $this).removeClass('bounceInDown'); 
                        $('.iconLinks a', $this).addClass('flipOutX'); 

                    }else{
                        $('.iconLinks', $this).stop(true, false).fadeOut('fast');
                    }

                });

            });
    }



    /*
    |--------------------------------------------------------------------------
    | ROLLOVER BTN
    |--------------------------------------------------------------------------
    */ 

    $('.socialIcon').hover(
        function () {
            $(this).stop(true, true).addClass('socialHoverClass', 300);
        },
        function () {
            $(this).removeClass('socialHoverClass', 300);
        });





    $('.tabs li, .accordion h2').hover(
        function () {
            $(this).stop(true, true).addClass('speBtnHover', 300);
        },
        function () {
            $(this).stop(true, true).removeClass('speBtnHover', 100);
        });



    /*
    |--------------------------------------------------------------------------
    | ALERT
    |--------------------------------------------------------------------------
    */ 
    $('.alert').delegate('button', 'click', function() {
        $(this).parent().fadeOut('fast');
    });
    
    
    /*
    |--------------------------------------------------------------------------
    | CLIENT
    |--------------------------------------------------------------------------
    */   
    
    if($('.colorHover').length){
        var array =[];
        $('.colorHover').hover(

            function () {

                array[0] = $(this).attr('src');
                $(this).attr('src', $(this).attr('src').replace('-off', ''));

            }, 

            function () {

                $(this).attr('src', array[0]);

            });
    }



    /*
    |--------------------------------------------------------------------------
    | Rollover boxIcon
    |--------------------------------------------------------------------------
    */ 
    if($('.boxIcon').length){

        $('.boxIcon').hover(function() {
            var $this = $(this);

            $this.css('opacity', '1');   
            //$this.find('.boxContent>p').stop(true, false).css('opacity', 0);
            $this.addClass('hover');
            $('.boxContent>p').css('bottom', '-50px');
            $this.find('.boxContent>p').stop(true, false).css('display', 'block');

            $this.find('.iconWrapper i').addClass('triggeredHover');    

            $this.find('.boxContent>p').stop(true, false).animate({
                'margin-top': '0px'},
                300, function() {
            // stuff to do after animation is complete
        });


        }, function() {
            var $this = $(this);
            $this.removeClass('hover');

            $this.find('.boxContent>p').stop(true, false).css('display', 'none');
            $this.find('.boxContent>p').css('margin-top', '250px');
            $this.find('.iconWrapper i').removeClass('triggeredHover'); 


        });   
    }   






    $('#quoteTrigger').click(function (e) {

        //$("#quoteWrapper").scrollTop(0);

        if(!$('#quoteFormWrapper').is(':visible')){
            $('html, body').animate({scrollTop: $("#quoteWrapper").offset().top}, 300);
        }

        var $this = $(this);


        $('#quoteFormWrapper').slideToggle('fast', function() {

            $this.text($('#quoteFormWrapper').is(':visible') ? "Close form" : "I have a project");

        });


        e.preventDefault();
    });



/*
|--------------------------------------------------------------------------
| SHARRRE
|--------------------------------------------------------------------------
*/
if($('#shareme').length){
  
    $('#shareme').sharrre({

    share: {
        googlePlus: true,
        facebook: true,
        twitter: true,
        linkedin: true
    },

    buttons: {
        googlePlus: {size: 'tall', annotation:'bubble'},
        facebook: {layout: 'box_count'},
        twitter: {count: 'vertical'},
        linkedin: {counter: 'top'}
    },

    enableHover: false,
    enableCounter: false,
    enableTracking: true,
      //url:'document.location.href'
  });
} 



/*
|--------------------------------------------------------------------------
| ROLL OVER PreviewTrigger
|--------------------------------------------------------------------------
*/
if($('.previewTrigger').length){

    $('.mask').css('height', $('.previewTrigger').height());
    $('.mask').css('width', $('.previewTrigger').width());
    // $('.mask', this).css('top', $('.previewTrigger', this).width());
    // $('.mask', this).css('left', $('.previewTrigger', this).width());

    $('.previewTrigger').hover(function() {

        var $this = $(this);

        $this.children('.mask').fadeIn('fast');

        if(Modernizr.csstransitions) {
            $('.iconWrapper', $this).addClass('animated');
            $('.iconWrapper', $this).css('display', 'block');
            $('.iconWrapper', $this).removeClass('flipOutX'); 
            $('.iconWrapper', $this).addClass('bounceInDown'); 
        }else{
            $('.iconWrapper', $this).stop(true, false).fadeIn('fast');
        }

    }, function() {

        var $this = $(this); 

        $this.children('.mask').fadeOut('fast');

        if(Modernizr.csstransitions) {
            $('.iconWrapper', $this).removeClass('bounceInDown'); 
            $('.iconWrapper', $this).addClass('flipOutX');
            $('.iconWrapper', $this).css('display', 'none');
            $('.iconWrapper', $this).removeClass('animated');
        }else{
            $('.iconWrapper', $this).stop(true, false).fadeOut('fast');
        }

    });
}





/*
|--------------------------------------------------------------------------
| AUTOCLOSE BOOSTRAP MENU
|--------------------------------------------------------------------------
*/
$('.nav a').on('click', function(){

	if($('.navbar-toggle').css('display') != 'none')
    $('.navbar-toggle').click();

});

//END DOCUMENT READY   
});



/*
|--------------------------------------------------------------------------
| EVENTS TRIGGER AFTER ALL IMAGES ARE LOADED
|--------------------------------------------------------------------------
*/
$(window).load(function() {



/**PROCESS ICONS**/
$('.iconBoxV3 a').hover(function() {

    if(Modernizr.csstransitions) {

        $(this).stop(false, true).toggleClass( 'hover', 150);
        $('i', this).css('-webkit-transform', 'rotateZ(360deg)');
        $('i', this).css('-moz-transform', 'rotateZ(360deg)');
        $('i', this).css('-o-transform', 'rotateZ(360deg)');
        $('i', this).css('transform', 'rotateZ(360deg)'); 

    }else{

       $(this).stop(false, true).toggleClass( 'hover', 150);

   }  

}, function() {

    if(Modernizr.csstransitions) {
        $(this).stop(false, true).toggleClass( 'hover', 150);
        $('i', this).css('-webkit-transform', 'rotateZ(0deg)');
        $('i', this).css('-moz-transform', 'rotateZ(0deg)');
        $('i', this).css('-o-transform', 'rotateZ(0deg)');
        $('i', this).css('transform', 'rotateZ(0deg)'); 

    }else{

        $(this).stop(false, true).toggleClass( 'hover', 150);
    }  
    
});


if($('.scrollMenu').length){


        if($('.localscroll').length){    
            $('.localscroll').localScroll({
                lazy: true,
                offset: {
                    top:  -80
                }
            });
        }

        var isMobile = false;

        if(Modernizr.mq('only all and (max-width: 1024px)') ) {
            isMobile = true;
        }

       
        if (isMobile === false && ($('#paralaxSlice1').length  ||isMobile === false &&  $('#paralaxSlice2').length ))
        {


            $(window).stellar({
                horizontalScrolling: false,
                responsive:true/*,
                scrollProperty: 'scroll',
                parallaxElements: false,
                horizontalScrolling: false,
                horizontalOffset: 0,
                verticalOffset: 0*/
            });

        }
  

    }


//END WINDOW LOAD
});

/*
|--------------------------------------------------------------------------
| FUNCTIONS
|--------------------------------------------------------------------------
*/



/* CONTACT FROM */

jQuery(function() {
    "use strict";
    if( jQuery("#contactfrm").length ){

      jQuery("#contactfrm").validate({
        // debug: true,
        errorPlacement: function(error, element) {
            error.insertBefore( element );
        },
        submitHandler: function(form) {
            jQuery(form).ajaxSubmit({
              target: ".result"
          });
        },
        onkeyup: false,
        onclick: false,
        highlight: function (element) {
        $(element).closest('.form-group').addClass('has-error');
        },
        errorElement: "div",
        success: function (element) {
        element.closest('.form-group').removeClass('has-error');
        },
        rules: {
            name: {
                required: true,
                minlength: 3
            },
            email: {
                required: true,
                email: true
            },
            phone: {
                required: true,
                minlength: 10,
                digits:true
            },
            comment: {
                required: true,
                minlength: 10,
                maxlength: 350
            }
        }
    });
  }

  if( jQuery("#projectQuote").length){

      jQuery("#projectQuote").validate({
        // debug: true,
        errorPlacement: function(error, element) {
            error.insertBefore(element);
        },
        submitHandler: function(form) {
            jQuery(form).ajaxSubmit({
              target: ".quoteResult"
          });
        },
        onkeyup: false,

        
        rules: {
            name: {
                required: true,
                minlength: 3
            },
            email: {
                required: true,
                email: true
            },
            company: {
                required: true,
                minlength: 2
            },
            quoteType:{
                required: true
            },
            comment: {
                required: true,
                minlength: 10,
                maxlength: 350
            }

        }
    });



  }

});

/* CONTACT FROM */

/* FLEXSLIDER INNER INFO CUSTOM ANIMATION */
function animateTxt(curSlide, action){
    "use strict";
    if(action === 'in'){
        var i = 0;
        var animaDelay = 0;

        $('.slideN'+curSlide+':not([class*=clone])>.caption').css('display', 'block');

        $('.slideN'+curSlide+':not([class*=clone])>.caption>div').each(function( ) {
            if(Modernizr.csstransitions) { 

                $(this).css('-webkit-animation-delay', animaDelay+'s');
                $(this).css('-moz-animation-delay', animaDelay+'s');
                $(this).css('-0-animation-delay', animaDelay+'s');
                $(this).css('-ms-animation-delay', animaDelay+'s');
                $(this).css('animation-delay-delay', animaDelay+'s');

                $(this).show().addClass('animated').addClass($(this).attr('data-animation'));


                // $(this).show('slow', function() {
                //     $(this).addClass('animated').addClass($(this).attr('data-animation'));
                // });


            }else{
                var timing;
                $('.slideN'+curSlide+':not([class*=clone])>.caption>div').hide();
                if (i === 0){timing = 0;}else if(i === 1){timing = 300;} else{ timing = 300 * i;}
                $(this).delay(timing).fadeIn('fast');
            }
            i++;
            animaDelay = animaDelay+0.2;


        });

    }else{
        var j = 0;
        $('.slideN'+curSlide+':not([class*=clone])>.caption').css('display', 'none');

        $('.slideN'+curSlide+':not([class*=clone])>.caption>div').each(function( ) {
         if(Modernizr.csstransitions) { 

             $(this).removeClass($(this).attr('data-animation')).removeClass('animated').hide();

         }else{
            $(this).hide();
        }
        j++;
    });
    }

}

