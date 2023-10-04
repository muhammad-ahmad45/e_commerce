$(document).ready(function() {
    // Handle the click event for the "+" button
    $('.increase-quantity').click(function() {
      var lineItemId = $(this).data('line-item-id');
      var quantityElement = $('.quantity[data-line-item-id="' + lineItemId + '"]');
      var totalElement = $('.total[data-line-item-id="' + lineItemId + '"]');
  
      // Increment the quantity by 1
      var newQuantity = parseInt(quantityElement.text()) + 1;
      quantityElement.text(newQuantity);
  
      // Update the total price for this line item
      var unitPrice = parseFloat($(this).closest('tr').find('td:eq(2)').text());
      var newTotal = newQuantity * unitPrice;
      totalElement.text(newTotal);
  
      // You can also make an AJAX request to update the server-side cart here if needed
    });
  
    // Handle the click event for the "-" button
    $('.decrease-quantity').click(function() {
      var lineItemId = $(this).data('line-item-id');
      var quantityElement = $('.quantity[data-line-item-id="' + lineItemId + '"]');
      var totalElement = $('.total[data-line-item-id="' + lineItemId + '"]');
  
      // Decrement the quantity by 1, but ensure it doesn't go below 1
      var newQuantity = Math.max(parseInt(quantityElement.text()) - 1, 1);
      quantityElement.text(newQuantity);
  
      // Update the total price for this line item
      var unitPrice = parseFloat($(this).closest('tr').find('td:eq(2)').text());
      var newTotal = newQuantity * unitPrice;
      totalElement.text(newTotal);
  
      // You can also make an AJAX request to update the server-side cart here if needed
    });
  });
  