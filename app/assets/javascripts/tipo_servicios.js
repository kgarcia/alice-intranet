
/* STEPS WIZARD */
//= require steps/jquery.steps.min.js

$(document).ready(function() {
    alturasIguales('.tab-pane');
});

$(window).on('load',function() {
    alturasIguales('.tab-pane');
});

$(window).on('resize',function() {
    alturasIguales('.tab-pane');
});