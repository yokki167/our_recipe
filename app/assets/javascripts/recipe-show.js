$(function(){

  var pattern = /\//;
var pattern2 = /\./;

var zairyo = $('.middle--wrapper__left__top__serve').text()

zairyo = zairyo.replace(/[^\d]/g, "");


  
  let btn = $("#button");
  let changeText = $('.middle--wrapper__left__ingre__amount');
  $('#button').click(function(e) {
    e.preventDefault();
    let input = $("#keyword").val();
    var array = [];

  $('.middle--wrapper__left__ingre__amount').each(function() {
    fff = $(this).text()

    if ((fff).match(pattern)){
    console.log('分数');
    result = fff.replace(/\//,"9999999")
    result = result.replace(/[^\d]/g, "");
    result = result.replace(/9999999/, "/");
    var bef = (result.slice(0,1))
      bef = bef / zairyo * input * 100;
      bef = Math.round(bef);
      bef = bef / 100;
    var aft = (result.slice(2))

    var sum = bef / aft
    sum = sum * 10;
    sum = Math.round(sum);
    sum = sum / 10
    ttt = fff.replace(/[\d]/g, "");
    ttt = ttt.replace(/\//, "pp");
    ggg = ttt.replace(/pp/,sum);
    console.log(ggg);

    array.push(ggg);

  } else if ((fff).match('適量')){
    ggg = fff
    console.log(ggg)
    array.push(ggg);
    
  } else if ((fff).match('種類')){
    ggg = fff
    console.log(ggg)
    array.push(ggg);


    
  } else if ((fff).match('少々')){
    ggg = fff
    console.log(ggg)
    array.push(ggg);

  } else if ((fff).match('ひと')){
    ggg = fff
    console.log(ggg)
    array.push(ggg);
    
  } else if ((fff).match('お好み')){
    ggg = fff
    console.log(ggg)
    array.push(ggg);

  } else if ((fff).match('好き')){
    ggg = fff
    console.log(ggg)
    array.push(ggg);


    
  } else if ((fff).match('半')){
      console.log(fff)
      fff = 0.5
      fff = fff / zairyo
      fff = fff * 10
      fff = Math.round(fff, 1);
      console.log(fff)
      fff = fff / 10
      fff = fff * input
      fff = Math.round(fff, 1);
      ggg = fff
      console.log(ggg)
      array.push(ggg);
  } 
  
    else if ((fff).match(pattern2)){
      console.log('少数だよ')
      var result = fff.replace(/[^\d]/g, "");
      result = result / 10
      result = result / zairyo
      result = result * 10
      result = Math.round(result);
      result = result / 10
      result = result * input
      result = result * 10
      result = Math.round(result);
      result = result / 10
    ttt = fff.replace(/[\d]/g, "");
    ttt = ttt.replace(/\./, "pp");
    ggg = ttt.replace(/pp/,result);
    console.log(ggg);
      array.push(ggg);
  } 

  else {
    console.log('整数だよ');
    var result = fff.replace(/[^\d]/g, "");

      result = result / zairyo
      result = result * 10
      result = Math.round(result);
      result = result / 100
      result = result * input
      result = result * 100
      result = Math.round(result);
      result = result / 10

    if (result == 0){
      console.log('エラーです');
      array.push(ggg);

    } else {
      ttt = fff.replace(/[\d]+/, "pppopo");
      var ggg = ttt.replace(/pppopo/,result);
      console.log(ggg);
      array.push(ggg);

    };
  }
  $(".result").empty();
  $.each(array, function(index, value){
    console.log(result);
       $(".result").append(value).append('<br />');
  })


  });
      
  });
  
});
