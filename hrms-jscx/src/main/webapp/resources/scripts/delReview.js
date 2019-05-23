//页面初始化
$(document).ready(function(){
	var mark = $("#mark").val();
    var items = mark.split("_");
    if (items.length == 13) {
        for (var i = 1; i <= 12; i++) {
            var id = "#mark" + i;
            $(id).val(items[i-1]);
        }
    }
    $('tbody tr:even').removeClass("alt-row"); 
	$('tbody tr.level1').addClass("alt-row");
	$('tbody tr').not('.alt-row').mouseover(function(){$(this).addClass("chooseRow");}).mouseout(function(){$(this).removeClass("chooseRow");}).click(function(){
		var offsetY = $(this).offset().top-$(".review-tab").offset().top + $(this).height();
		$(".docViewPanel").show().css("top",offsetY);
	});
	$(".docPanelClose a").click(function(){$(".docViewPanel").hide();return false;});
	$(".docViewPanel").width($("#main-content").width()-320);
	$('.mark').hide().each(function(){
		var id = $(this).attr("id");
		var value = $(this).parent().parent().find("td")[2].innerHTML;
		var sliderID = "slider_"+id;
		var showID = "span_slider_"+id;
		$(this).parent().append("<div id='"+showID+"' class='score'></div><div class='sliderBar' id='"+sliderID+"'></div>");
		$("#"+sliderID).slider({
			range:"min",
			value:$("#"+id).val(),
			min:0,
			max:value,
			slide:function(event,ui){
				if(ui.value < 0) ui.value = 0;
				$("#"+id).val(ui.value);
				$("#"+showID).text($("#"+id).val() + "分");
				scoreAll();
			}
		});
		if($(this).val() > 0){
			$("#"+showID).text($("#"+id).val() + "分");
		}
		scoreAll();
	});
	function scoreAll(){
		var sum = 0;
		$(".mark").each(function(i,n){
			var _current_score = 0;
			
			if($(this).val() != ""){
				_current_score = parseInt($(this).val());
			}
			sum = sum + _current_score;
		});
		if(sum < 0) sum = 0;
		$("#scoreAll").text(sum + "分");
	}
	
});