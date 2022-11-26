# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# jQuery ->
#     addresses = $('#Address_of_the_building').html()
#     $('#company_name').change ->
#     customer = $('#company_name :selected').text()
#     options = $(addresses).filter("optgroup[label='#{customer}']").html()
#     if options
#         $('#Address_of_the_building').html(options)
#     else
#         $('#Address_of_the_building').empty()
jQuery ->
    building = $('#intervention_BuildingID').html()
    $('#intervention_CustomerID').click ->
        customer = $('#intervention_CustomerID :selected').text()
        options1 = $(building).filter("optgroup[label='#{customer}']").html()

        if options1
            $('#intervention_BuildingID').html(options1)
        else
            $('#intervention_BuildingID').empty()

    battery = $('#intervention_BatteryID').html()
    $('#intervention_BuildingID').click ->
        building = $('#intervention_BuildingID :selected').text()
        options2 = $(battery).filter("optgroup[label='#{building}']").html()

        if options2
            $('#intervention_BatteryID').html(options2)
        else
            $('#intervention_BatteryID').empty()    

    column = $('#intervention_ColumnID').html()
    $('#intervention_BatteryID').click ->
        battery = $('#intervention_BatteryID :selected').text()
        options3 = $(column).filter("optgroup[label='#{battery}']").html()

        if options3
            $('#intervention_ColumnID').html(options3)
        else
            $('#intervention_ColumnID').empty()

    elevator = $('#intervention_ElevatorID').html()
    $('#intervention_ColumnID').click ->
        column = $('#intervention_ColumnID :selected').text()
        options4 = $(elevator).filter("optgroup[label='#{column}']").html()

        if options4
            $('#intervention_ElevatorID').html(options4)
        else
            $('#intervention_ElevatorID').empty()