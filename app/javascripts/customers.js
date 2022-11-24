$(document).on("change", "#customer select", function(){
    var customer = $(this).val();
  
    $.ajax({
      url: "/interventions/_form",
      method: "GET",
      dataType: "json",
      data: {customer: customer},
      error: function (xhr, status, error) {
        console.error('AJAX Error: ' + status + error);
      },
      success: function (response) {
        console.log(response);
        var building = response["building"];
        $("#building select").empty();
  
        $("#building select").append('<option>Select building</option>');
        for(var i=0; i< building.length; i++){
          $("#building select").append('<option value="' + building[i]["id"] + '">' + building[i]["name"] + '</option>');
        }
      }
    });
  });