// $(document).on('turbolinks:load', function(data){
$(document).ready(function(){

  // $("#datetimepicker1").datepicker();
  $('.create-available-date').datepicker();


  $('.create-reservation-date').datepicker();
    // {
      // debugger
    //   array = JSON.parse(data)
    //   beforeShowDay: function(date){
    //       var string = jQuery.datepicker.formatDate('dd-mm-yy', date);
    //       return [$.inArray(string, array.book_dates) == -1];
    // }
  // }
// );
});






// $(document).ready(function(){
//   var unavailable_dates = $('.unavailable_dates').data('abc');
//
//
//     $(function() {
//
//       $("#reservation_start_date").datepicker({
//         dateFormat: 'dd-mm-yy',
//         minDate: 0,
//         maxDate: '3m',
//         onSelect: function(selected) {
//           // end_date field set the minimum date to be ur selected start date
//           $('#reservation_end_date').datepicker("option", "minDate", selected);
//
//          $('#reservation_end_date').attr('disabled', false);
//         }
//       });
//
//      $("#reservation_end_date").datepicker({
//         dateFormat: 'dd-mm-yy',
//         minDate: 0,
//         maxDate: '3m',
//         onSelect: function(selected) {
//           // if i click on a date on end date field first, then the start date field will set the selected date as the maximum date
//           $('#reservation_start_date').datepicker("option", "maxDate", selected);
//         }
//       });
//     })


// });
