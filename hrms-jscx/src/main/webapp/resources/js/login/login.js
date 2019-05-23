$(document).on("click",".dept-wrap",function(){
	$(this).toggleClass("show");
});

$(document).on("click",".dept-wrap ul li",function(e){
	$(".dept-wrap label").text($(this).text());
	$(".dept-wrap").toggleClass("show");
	return false;
});

$(document).on("click",function(e){        
    if($(e.target).closest(".dept-wrap").length == 0 && $(".dept-wrap").hasClass("show")){
        $(".dept-wrap").toggleClass("show");
    }
});