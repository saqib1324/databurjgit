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
//= require angular
//= require angular-rails-templates
//= require angular-animate
//= require angular-resource
//= require_tree
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks



//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap
//= require codemirror
//= require codemirror/modes/ruby
//= require codemirror/modes/sass
//= require codemirror/modes/shell
//= require codemirror/modes/sql
//= require codemirror/modes/slim
//= require codemirror/modes/nginx
//= require codemirror/modes/markdown
//= require codemirror/modes/javascript
//= require codemirror/modes/http
//= require codemirror/modes/htmlmixed
//= require codemirror/modes/haml
//= require codemirror/modes/xml
//= require codemirror/modes/css
//= require codemirror/modes/yaml
//= require codemirror/modes/slim
//= require codemirror/modes/php
//= require summernote

//= require_tree .
//= require turbolinks


// $(document).ready(function() {
// 	$('[data-toggle="offcanvas"]').click(function() {
// 		$('#side-menu').toggleClass('hidden-xs');
// 	});
// });
// $(document).ready(function(){
//     setTimeout(function() {
//         $('#notice_wrapper').fadeOut("slow", function(){
//             $(this).remove();
//         });
//     }, 1500);
// });

/* global $*/

$(document).ready(function() {
 setTimeout(function(){
  $('#notice_wrapper').fadeOut(("slow"), function() {
   $(this).remove();
  });
 }, 4000);
});

