$('#catogaries').hide();
$('#productmenuitem').mouseover(function (){
    $('#catogaries').show(500);
    $('#menudiv').css({height: 'auto'});
});
$('#menudiv').mouseleave(function (){
    $('#catogaries').hide(500);
    $('#menudiv').css({height: 'auto'});
});
$('#catogaries').mouseleave(function (){
    $('#catogaries').hide(500);
    $('#menudiv').css({height: 'auto'});
});
$('.nosubmenu').mouseover(function (){
    $('#catogaries').hide(500);
    $('#menudiv').css({height: 'auto'});
});


