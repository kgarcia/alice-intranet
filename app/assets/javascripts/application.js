// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery2.js
//= require bootstrap-sprockets
//= require metisMenu/jquery.metisMenu.js
//= require pace/pace.min.js
//= require slimscroll/jquery.slimscroll.min.js
//= require_tree .
//= require footable/footable.min.js

//= require datapicker/bootstrap-datepicker.js
//= require moment
//= require moment/es
//= require fullcalendar
//= require fullcalendar/lang/es
//= require bootstrap-datetimepicker

//= require tinymce

//= require dataTables/jquery.dataTables

//= require highcharts
//= require highcharts/modules/exporting
//= require highcharts/modules/heatmap
//= require toastr
//= require rating.min.js
//= require jasny/jasny-bootstrap.min.js

$.extend(true, $.fn.dataTable.defaults, {
    "language": {"url": "/js/datatables/Spanish.json"}
});






