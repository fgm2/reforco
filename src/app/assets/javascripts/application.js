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


$(document).ready(function() {
    $('#dialog_form').hide();
    $('#add_user_view').click(function() {
        $('#dialog_form').dialog( {
            overlay: "#000000",        // Overlay color
            opacity: 0.75,
            show : "slide",
            hide : "toggle",
            width: 100,
            height: 200,
            modal: true,
            title: "Login em reforco.com",
            buttons: {
                "Login": function()
                {
                    // ## CODE TO SUBMIT THE FORM USING AJAX
                },
                "Cancel" : function()
                {
                    $("#dialog_form").dialog("close");
                }
            }
        }).prev().find(".ui-dialog-titlebar-close").hide(); // To hide the standard close button
            return false
    });
});

 $('#showModal').click(function(e) {
  e.preventDefault();
  var modalId = $(this).attr('data-modal');
  var modal = $('#' + modalId);
  if (modal.length) {
    window.closeModal();
    openModal(modal);
  }
});