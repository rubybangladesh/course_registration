$(document).ready(function() {
    var total_credit = 0;
    var maximum_credit = 5;
    $('#new_enroll :checkbox').change(function() {
        if ($(this).prop('checked')) {
            var credit = $(this).data("credit");
            if(total_credit + parseFloat(credit) > maximum_credit){
                $('#new_enroll :checkbox').attr('disabled', true);
                $(this).attr('checked', false);
                $('#new_enroll :checkbox').removeAttr("disabled");
                $('#credit-form').fadeIn("slow");
            }
            else {
                total_credit = total_credit + parseFloat(credit);
                $('#display-credit').html('<h2>Total Credit: </h2>' + total_credit);
            }
            console.log(total_credit);


        }
        else {
            $('#credit-form').fadeOut("slow");
            $('#new_enroll :checkbox').removeAttr("disabled");
            var credit = $(this).data("credit");
            if(total_credit != 0) {
                total_credit = total_credit - parseFloat(credit);
            }

            console.log(total_credit);
            $('#display-credit').html('<h2>Total Credit: </h2>' + total_credit);
        }
    });
});