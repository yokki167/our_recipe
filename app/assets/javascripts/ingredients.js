$(function(){
  var number = 0
  $('.middle--wrapper__left__ingre').on('click', function(){
    if (number % 2 === 0){
    var input = $(this).attr('id');
    // var id = $('this').attr('id');
    $(`#${input}`).css('background-color', 'rgb(10, 179, 231, 0.534)');
  } else {
    var input = $(this).attr('id');
    // var id = $('this').attr('id');
    $(`#${input}`).css('background-color', 'rgb(255, 255, 255)');

  }
  number=number+1

  })

})