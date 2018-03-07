var $ = require('jquery');
var moment = require('moment');

$(function() {
  var date = moment().format('dddd, MMMM Do, YYYY');
  $('.today').html('<p style="color: blue">Hello from jQuery land!<br/>Moment.js says today is ' + date + '.</p>');
});

$(document).ready(function(){
  $('.menu-trigger,.fade-screen,.sliding-panel-close').on('click touchstart',function (e) {
    $('.mobile-menu-content,.fade-screen, main').toggleClass('menu-open');
    e.preventDefault();
  });
});
