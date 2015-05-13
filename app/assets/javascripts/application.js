//= require jquery
//= require jquery_ujs
//= require jquery.dynatable
//= require_tree .

$( document ).ready(function() {
    $('#table-products-category').dynatable({
    table: {
    	defaultColumnIdStyle: 'underscore'
  	}
    });
});