$(function() {
  $.datepicker.setDefaults({
    dateFormat: "yy-mm-dd",
    changeMonth: true,
    changeYear: true
  });
  
  $("#start-date").datepicker({
    minDate: 0,
    onSelect: function(selected) {
      $("#end-date").datepicker("option","minDate", selected);
    }
  });
  
  $("#end-date").datepicker({
    minDate: 1
  });
});

let startDateInput = document.getElementById('start-date');
let endDateInput = document.getElementById('end-date');
const today = new Date();
const year = today.getFullYear();
const month = String(today.getMonth() + 1).padStart(2, '0');
const day = String(today.getDate()).padStart(2, '0');


const check_in=document.getElementById('check_in_date');
const check_out=document.getElementById('check_out_date');
const check_nights=document.getElementById('check_nights');
const total_price=document.getElementById('total_price');
const hiddenPrice=document.getElementById('hiddenPrice').value;


const formattedDate = `${year}-${month}-${day}`;
startDateInput.value = formattedDate;

check_in.innerHTML=formattedDate;
check_out.innerHTML=formattedDate;
check_nights.innerHTML='0박';





