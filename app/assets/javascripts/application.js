// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require_tree .

$(function () {
  $('.edit-content table').addClass('table table-bordered');
  $('.edit-content code').each(function (_, element) {
    var $element = $(element);
    $element.text($element.text().replace(/^\n/, ''));
  });
  $('.edit-content').each(function (_, element) {
    var html = $(element).html();
    var pattern = /(#(\d+))/g;
    var replacer = '<a href=\'' + location.href.replace(/\d+$/, '$2') + '\'>$1</a>';
    var replaced = html.replace(pattern, replacer);
    $(element).html(replaced);
  });
});
