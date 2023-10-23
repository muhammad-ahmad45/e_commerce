$(document).on('turbo:load', function() {
   // Function to update the total bill
   function updateTotalBill() {
    var totalBill = 0;

    // Iterate through each element with class .total
    $('.total').each(function() {
      var totalRowPrice = parseFloat($(this).text());
      totalBill += totalRowPrice;
    });

    // Update the displayed total bill
    $('#total-bill').text(totalBill);
  }


  // Handle the click event for the "+" button
  $('.increase-quantity').click(function() {
    var lineItemId = $(this).data('line-item-id');
    var quantityElement = $('.quantity[data-line-item-id="' + lineItemId + '"]');

    // Increment the quantity by 1
    var newQuantity = parseInt(quantityElement.text()) + 1;
    quantityElement.text(newQuantity);

    // Update the total price for this line item
    var unitPrice = parseFloat($('.unit-price[data-line-item-id="' + lineItemId + '"]').text());
    var totalRowPrice = newQuantity * unitPrice;
    $('.total[data-line-item-id="' + lineItemId + '"]').text(totalRowPrice);

    // Make an AJAX request to update the quantity in the database
    updateQuantity(lineItemId, newQuantity);

    // Recalculate and update the total bill
    updateTotalBill();
  });

  // Handle the click event for the "-" button
  $('.decrease-quantity').click(function() {
    var lineItemId = $(this).data('line-item-id');
    var quantityElement = $('.quantity[data-line-item-id="' + lineItemId + '"]');

    // Decrement the quantity by 1, but ensure it does not go below 1
    var newQuantity = Math.max(parseInt(quantityElement.text()) - 1, 1);
    quantityElement.text(newQuantity);

    // Update the total price for this line item
    var unitPrice = parseFloat($('.unit-price[data-line-item-id="' + lineItemId + '"]').text());
    var totalRowPrice = newQuantity * unitPrice;
    $('.total[data-line-item-id="' + lineItemId + '"]').text(totalRowPrice);

    // Make an AJAX request to update the quantity in the database
    updateQuantity(lineItemId, newQuantity);

    // Recalculate and update the total bill
    updateTotalBill();
  });


//Add header
$.ajaxSetup({
  headers: {
    'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
  }
});

// Function to make an AJAX request to update the quantity
function updateQuantity(lineItemId, newQuantity) {
  lineItemId = parseInt(lineItemId); // Convert lineItemId to an integer
  $.ajax({
    url: 'line_items/' + lineItemId + '/update_quantity',
    type: "PATCH",
    data: { new_quantity: newQuantity }
  });
}
  // Initial calculation of total bill when the page loads
  updateTotalBill();
});
