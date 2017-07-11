App.product = App.cable.subscriptions.create("ProductChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    $(".alert.alert-info").show();
	  $('.product-reviews').prepend(data.comment);
	  $("#average-rating").attr('data-score', data.average_rating);
	  refreshRating();    
	  // data.comment contains the partial. So we just need to prepend it to our existing comments. 
	  // We defined refreshRating() to contain all the code to update Raty.
    // console.log(data.comment.body);
    // console.log(data);
  },

	listen_to_comments: function() {
		return this.perform('listen', {
    	product_id: $("[data-product-id]").data("product-id")
  });
	}

	// ActionCable provides a function to call the methods of the ActionCable backend, 
	// including the one you just wrote. You call it with App.product.perform().
	// App.product represents the subscriber object for the product channel. 
	// As long as you're inside the object of the create() function, you can also simply refer to App.product as this. 
	// perform() expects at least one argument. 
	// The first argument is the name of the method you want to call.
	// In this case, it's listen. Any additional arguments are going to be values for the arguments of the listen method. 
	// Since we defined a single argument for the listen method, we'll add an object as the second argument of the perform() function.
});

$(document).on('turbolinks:load', function() {
  App.product.listen_to_comments();
  // This will make sure listen_to_comments() is called every single time the user loads a new page.
});