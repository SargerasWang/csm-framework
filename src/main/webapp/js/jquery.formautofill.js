/**
 * form autofill (jQuery plugin)
 * Version: 0.1
 * Released: 2011-11-30
 * 
 * Copyright (c) 2011 Creative Area
 * Dual licensed under the MIT or GPL Version 2 licenses.
 *
 * Require jQuery
 * http://jquery.com/
 * Copyright 2011, John Resig
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * http://jquery.org/license
 */
(function($){
	$.fn.extend({
		autofill: function(data, options) {
			var settings = {
					findbyname: true,
					restrict: true
				},
				self = this;
				
			if ( options ) {
				$.extend( settings, options );
			}
			
			return this.each(function() {
				$.each( data, function(k, v) {
					
					// switch case findbyname / findbyid
					
					var selector, elt;
					
					if ( settings.findbyname ) { // by name
						
						selector = '[name="'+k+'"]';
						elt = ( settings.restrict ) ? self.find( selector ) : $( selector );
						
						if ( elt.length == 1 ) {
							if(elt.prop("tagName") == "TEXTAREA" && elt.code ){
								elt.code(v);
							}else{
                                if(elt.attr("type") == "checkbox" ){
                                    elt.val([v]);
                                }else if(elt.attr("type") == "date" ){
                                    var d = new Date(v);
                                    var day = ("0" + d.getDate()).slice(-2);
                                    var month = ("0" + (d.getMonth() + 1)).slice(-2);
                                    var today = d.getFullYear()+"-"+(month)+"-"+(day) ;
                                    elt.val(today);
                                }else{
                                    elt.val(v);
                                }
							}
						} else if ( elt.length > 1 ) {
							// checkbox 并且 data中有逗号
							if(self.find('input:checkbox[name="'+k+'"]').length == elt.length
								&& v!=null && v.indexOf(",")!=-1){
								var chkArr = v.split(",");
								$(elt).each(function(){
									if($.inArray(this.value,chkArr) != -1){
										this.checked = true;
									}
								})
							}else{
								// radio
								elt.val([v]);
							}
						} else {
							selector = '[name="'+k+'[]"]';
							elt = ( settings.restrict ) ? self.find( selector ) : $( selector );
							elt.each(function(){
								$(this).val(v);
							});
						}
						
					} else { // by id
						
						selector = '#'+k;
						elt = ( settings.restrict ) ? self.find( selector ) : $( selector );
						
						if ( elt.length == 1 ) {
							if(elt.prop("tagName") == "TEXTAREA" && elt.code ){
								elt.code(v);
							}else{
                                if(elt.attr("type") == "checkbox" ){
                                    elt.val([v]);
                                }else if(elt.attr("type") == "date" ){
                                    var d = new Date(v);
                                    var day = ("0" + d.getDate()).slice(-2);
                                    var month = ("0" + (d.getMonth() + 1)).slice(-2);
                                    var today = d.getFullYear()+"-"+(month)+"-"+(day) ;
                                    elt.val(today);
                                }else{
                                    elt.val(v);
                                }
							}
						} else {
							var radiofound = false;
							
							// radio
							elt = ( settings.restrict ) ? self.find( 'input:radio[name="'+k+'"]' ) : $( 'input:radio[name="'+k+'"]' );
							elt.each(function(){
								radiofound = true;
								if ( this.value == v ) { this.checked = true; }
							});
							// multi checkbox
							if ( !radiofound ) {
								elt = ( settings.restrict ) ? self.find( 'input:checkbox[name="'+k+'[]"]' ) : $( 'input:checkbox[name="'+k+'[]"]' );
								elt.each(function(){
									$(this).val(v);
								});
							}
						}
					}
				});
			});
		}
	});
})(jQuery);