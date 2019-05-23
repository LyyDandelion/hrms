$(document).ready(function(){
	//Sidebar Accordion Menu:
		
		$("#main-nav li ul").hide(); // Hide all sub menus
		$("#main-nav li a.current").parent().find("ul").slideToggle("slow"); // Slide down the current menu item's sub menu
		
		$("#main-nav li a.nav-top-item").click( // When a top menu item is clicked...
			function () {
				$(this).parent().siblings().find("ul").slideUp("normal"); // Slide up all sub menus except the one clicked
				$(this).next().slideToggle("normal"); // Slide down the clicked sub menu
				return false;
			}
		);
		
		$("#main-nav li a.no-submenu").click( // When a menu item with no sub menu is clicked...
			function () {
				window.location.href=(this.href); // Just open the link instead of a sub menu
				return false;
			}
		); 
		
		var page_id= "." +  $("#page_id").val();
		$(page_id).addClass('current').parent().parent().slideToggle(0);
    // Content box tabs:
		
		$('.content-box .content-box-content div.tab-content').hide(); // Hide the content divs
		$('ul.content-box-tabs li a.default-tab').addClass('current'); // Add the class "current" to the default tab
		$('.content-box-content div.default-tab').show(); // Show the div with class "default-tab"
		
		$('.content-box ul.content-box-tabs li a').click( // When a tab is clicked...
			function() { 
				$(this).parent().siblings().find("a").removeClass('current'); // Remove "current" class from all tabs
				$(this).addClass('current'); // Add class "current" to clicked tab
				var currentTab = $(this).attr('href'); // Set variable "currentTab" to the value of href of clicked tab
				$(currentTab).siblings().hide(); // Hide all content divs
				$(currentTab).show(); // Show the content div with the id equal to the id of clicked tab
				return false; 
			}
		);

    //Close button:
		
		$(".close").click(
			function () {
				$(this).parent().fadeTo(400, 0, function () { // Links with the class "close" will close parent
					$(this).slideUp(400);
				});
				return false;
			}
		);

    // Alternating table rows:
		
		$('tbody tr:even').addClass("alt-row"); // Add class "alt-row" to even table rows


    // Initialise Facebox Modal window:
		
		$('a[rel*=modal]').facebox(); // Applies modal window to any link with attribute rel="modal"
		$(document).pngFix();
    // Initialise jQuery WYSIWYG:
		
		$(".wysiwyg").wysiwyg(); // Applies WYSIWYG editor to any textarea with the class "wysiwyg"
	//DatePicker
	$(".datepicker").datepicker({onSelect:function(dateText,inst){$(this).blur();}});
	//Show Current Time
		var currentTime = new Date();
		var month = currentTime.getMonth()+1;
		$("#currentTime").text(currentTime.getFullYear()+'-'+month+'-'+currentTime.getDate()+' '+currentTime.getHours()+':'+currentTime.getMinutes()+':'+currentTime.getSeconds()+'');
	//约束
		// ----------------------------------------------------------------------
	// <summary>
	// 限制只能输入数字
	// </summary>
	// ----------------------------------------------------------------------
	$.fn.onlyNum = function () {
		$(this).keypress(function (event) {
			var eventObj = event || e;
			var keyCode = eventObj.keyCode || eventObj.which;
			if ((keyCode >= 48 && keyCode <= 57 ) || keyCode == 8)
				return true;
			else
				return false;
		}).focus(function () {
		//禁用输入法
			this.style.imeMode = 'disabled';
		}).bind("paste", function () {
		//获取剪切板的内容
			var clipboard = window.clipboardData.getData("Text");
			if (/^\d+$/.test(clipboard))
				return true;
			else
				return false;
		});
	};
	
	$.fn.onlyNumAlpha = function () {
		$(this).keypress(function (event) {
			var eventObj = event || e;
			var keyCode = eventObj.keyCode || eventObj.which;
			if ((keyCode >= 48 && keyCode <= 57) || (keyCode >= 65 && keyCode <= 90) || (keyCode >= 97 && keyCode <= 122) || keyCode == 8)  
				return true;
			else
				return false;
		}).focus(function () {
		//禁用输入法
			this.style.imeMode = 'disabled';
		}).bind("paste", function () {
		//获取剪切板的内容
			var clipboard = window.clipboardData.getData("Text");
			if (/^(\d|[a-zA-Z])+$/.test(clipboard))
				return true;
			else
				return false;
		});
	};
	$(".number").onlyNum();
	$(".numalpha").onlyNumAlpha();
	//处理两级菜单页面
	

	var orgLists = $("#subDpts").val();
	if(orgLists && orgLists.length>0){
		orgLists = eval(orgLists);
	}
	$(".level1drop").change(function(){
		var current_select = $(this).children('option:selected').val();
		var rows = [];
		$(".level2drop option").remove();
		for ( var i = 0; i < orgLists.length; i++) {
			var item_name = orgLists[i].name;
			var item_id = orgLists[i].id;
			var item_pid = orgLists[i].higherId;
			if(item_pid == current_select){
				rows[rows.length] = orgLists[i];
				jQuery("<option></option>").val(item_id).text(item_name).appendTo(".level2drop");
			}
		}
		if(rows.length == 0){
			$(".realOrgVal").val(current_select);
			$(".subOrgWrapper").hide();
		}else{
			$(".realOrgVal").val($(".level2drop").children('option:selected').val());
			$(".subOrgWrapper").show();
		}
	});
	$(".level2drop").change(function(){
		var current_select = $(this).children('option:selected').val();
		$(".realOrgVal").val(current_select);
	});
	//初始化
	var actionType = $(".actionType").val();
	if(actionType == "add"){
		$(".level1drop").change();
	}else if(actionType=="edit"){
	//处理修改页面
		var findOrg = false;
		var curent_org = $(".realOrgVal").val();
		for ( var i = 0; i < orgLists.length; i++) {
			var item_id = orgLists[i].id;
			var item_pid = orgLists[i].higherId;
			if(item_id == curent_org){
				findOrg = true;
				$(".level1drop").attr("value",item_pid);
				$(".level1drop").change();
				$(".level2drop").attr("value",item_id);
			}
		}
		if(!findOrg){
			$(".level1drop").attr("value",curent_org);
			$(".subOrgWrapper").hide();
		}
	}

	//提交角色
	$("#submitNewRole").click(function(){
		var isAllValid = true;
		var isCheckedAtleastOneItem = false;
		
        jQuery.each($(".roleItem"), function () {
            if ($(this).attr('checked')) {
                isCheckedAtleastOneItem = true;
            }
        });
		
		if(isCheckedAtleastOneItem){
			$(".afterCheckBox").text(" ").removeClass("error").removeClass("info").addClass("success");
		}else{
			$(".afterCheckBox").text("请至少选择一个角色。").removeClass("info").removeClass("success").addClass("error");
			isAllValid = false;
		}
		return isAllValid;
	});
	
	//提交Auth
	$("#submitNewAuth").click(function(){
		var isAllValid = true;
		var isCheckedAtleastOneItem = false;
		
        jQuery.each($(".docType"), function () {
            if ($(this).attr('checked')) {
                isCheckedAtleastOneItem = true;
            }
        });
		
		if(isCheckedAtleastOneItem){
			$(".afterCheckBox").text(" ").removeClass("error").removeClass("info").addClass("success");
		}else{
			$(".afterCheckBox").text("请至少选择一个文档类型。").removeClass("info").removeClass("success").addClass("error");
			isAllValid = false;
		}
		return isAllValid;
	});
	
	//验证密码修改页面信息
	$(".requiredFeild").blur(function(){
		if($(this).val() != ""){
			$(this).siblings(".input-notification").text(" ").removeClass("error").removeClass("info").addClass("success");
		}else{
			$(this).siblings(".input-notification").text(" ").removeClass("info").removeClass("info").addClass("error");
		}
	});
	$("#newPasswordAgain").blur(function(){
		if($(this).val() != $("#newPassword").val()){
			$(this).siblings(".input-notification").text("两个新密码不相符，请重新输入！").removeClass("info").removeClass("success").addClass("error");
		}else{
			$(this).siblings(".input-notification").text(" ").removeClass("error").removeClass("info").addClass("success");
		}
	});
	$("#email").blur(function(){
		if($("#email").val().indexOf("@")<0){
			$(this).siblings(".input-notification").text("邮箱输入错误！").removeClass("info").removeClass("success").addClass("error");
		}else{
			$(this).siblings(".input-notification").text(" ").removeClass("error").removeClass("info").addClass("success");
		}
	});
	$("#newPassword").blur(function(){
		if($("#newPasswordAgain").val() != "" && $(this).val() != $("#newPasswordAgain").val()){
			$("#newPasswordAgain").siblings(".input-notification").text("两个新密码不相符，请重新输入！").removeClass("info").removeClass("success").addClass("error");
		}else if($("#newPasswordAgain").val() != "" && $(this).val() == $("#newPasswordAgain").val()){
			$("#newPasswordAgain").siblings(".input-notification").text(" ").removeClass("error").removeClass("info").addClass("success");
		}
		$(this).siblings(".input-notification").text(" ").removeClass("error").removeClass("info").addClass("success");
	});
	
	$("#submitGroup").click(function(){
		var isAllValid = true;
        jQuery.each($(".requiredFeild"), function () {
            if ($(this).val() == "") {
                $(this).focus();
                isAllValid = false;
                return false;
            }
        });
		return isAllValid;
	});
	$("#submitChangePassword").click(function(){
		var isAllValid = true;
        jQuery.each($(".requiredFeild"), function () {
            if ($(this).val() == "") {
                $(this).focus();
                isAllValid = false;
                return false;
            }
        });
		if($("#newPassword").val() != $("#newPasswordAgain").val()){
			isAllValid = false;
		}
		return isAllValid;
	});
	
	$("#role1,#role2,#role3,#role4,#role5").click(function(){
		if($("#role1").attr('checked') || $("#role2").attr('checked') || $("#role3").attr('checked') || $("#role4").attr('checked') || $("#role5").attr('checked') ){
			$(".afterCheckBox").text(" ").removeClass("error").removeClass("info").addClass("success");
		}else{
			$(".afterCheckBox").text("请至少选择一个角色。").removeClass("info").removeClass("success").addClass("error");
		}
	});
	
	$("#submitNewUser").click(function(){
		var isAllValid = true;
        jQuery.each($(".requiredFeild"), function () {
            if ($(this).val() == "") {
                $(this).focus();
                isAllValid = false;
                return false;
            }
        });
		
		if(actionType == "add" && $("#newPassword").val() != $("#newPasswordAgain").val()){
			isAllValid = false;
		}
		
		if($("#email").val().indexOf("@")<0){
			isAllValid = false;
		}
		return isAllValid;
	});

	
	$(".docType").click(function(){
		var isCheckedAtleastOneItem = false;
        jQuery.each($(".docType"), function () {
            if ($(this).attr('checked')) {
                isCheckedAtleastOneItem = true;
            }
        });
		if(isCheckedAtleastOneItem){
			$(".afterCheckBox").text(" ").removeClass("error").removeClass("info").addClass("success");
		}else{
			$(".afterCheckBox").text("请至少选择一个文档类型。").removeClass("info").removeClass("success").addClass("error");
		}
	});
	
	$("#submitEditUser").click(function(){
		var isAllValid = true;
        jQuery.each($(".requiredFeild"), function () {
            if ($(this).val() == "") {
                $(this).focus();
                isAllValid = false;
                return false;
            }
        });
		
		if($("#role1").attr('checked') || $("#role2").attr('checked') || $("#role3").attr('checked') || $("#role4").attr('checked') || $("#role5").attr('checked') ){
			$(".afterCheckBox").text(" ").removeClass("error").removeClass("info").addClass("success");
		}else{
			$(".afterCheckBox").text("请至少选择一个角色。").removeClass("info").removeClass("success").addClass("error");
			isAllValid = false;
		}
		return isAllValid;
	});
	//loginName验证是否存在
	$("#loginName").blur(function(){
		$.ajax({
			url:'../ajax/ajax_chkUser.do',
			data:{loginName:$(this).val(),random:Math.random()},
			type:'get',
			cache:false,
			success:function(data){
				if(data == "true"){
					$(this).siblings(".input-notification").text(" ").removeClass("error").removeClass("info").addClass("success");
				}else{
					$(this).siblings(".input-notification").text("用户名已存在，请重新输入！").removeClass("info").removeClass("info").addClass("error");
				}
			},
			error:function(XMLHttpRequest, textStatus, errorThrown){
				$(this).siblings(".input-notification").text("获取数据异常，请重试！").removeClass("info").removeClass("info").addClass("error");
			}
		});
	});
	//初始化修改的值
	jQuery.each($(".currole"), function () {
		var currentID = "#role"+$(this).val();
		$(currentID).attr("checked","checked");
    });
	//返回上一步骤
	$("div.content-box-tabs a").click(function(){
		history.back(-1);
		return false;
	});

	
	
	
	
	

	
	
	
	
	if($("#bankData").text()){
	
	var bankData = eval($("#bankData").text());
	var bankGroup = [];
	var bankSelectText = "";
	for(var m=0;m<bankData.length;m++){
		var typeId = bankData[m].typeId;
		var typeName = bankData[m].typeName;
		var obj = {};
		obj.id= bankData[m].id;
		obj.name = bankData[m].name;
		if(bankGroup[typeName]){
			bankGroup[typeName].item[bankGroup[typeName].item.length] = obj;
			bankGroup[typeName].selectText += "<option value='"+obj.id+"'>"+obj.name+"</option>";
		}else{
			bankGroup[typeName] = {};
			bankGroup[typeName].typeName = typeName;
			bankGroup[typeName].typeId = typeId;
			bankGroup[typeName].item = [];
			bankGroup[typeName].item[0] = obj;
			$("#jglx").append("<option value='"+typeId+"'>"+typeName+"</option>");
			bankGroup[typeName].selectText = "<option value='"+obj.id+"'>"+obj.name+"</option>";
		}
		bankSelectText += "<option value='"+obj.id+"'>"+obj.name+"</option>";
	}
	$("#bcjg").append("<option value='0' selected='selected'></option>");
	$("#bcjg").append(bankSelectText);
	$("#jglx").change(function(){
		$("#searchBankName").val("");
		var _cur_value = $(this).children('option:selected').text();
		$("#bcjg").empty();
		$("#bcjg").append("<option value='0' selected='selected'></option>");
		if(_cur_value == ""){
			$("#bcjg").append(bankSelectText);
		}else{
			$("#bcjg").append(bankGroup[_cur_value].selectText);
		}
	});
	$("#bcjg").change(function(){
		$("#searchBankValue").val($(this).children('option:selected').val());
		$("#searchBankName").val($(this).children('option:selected').text());
		//$("#groupName").val($(this).children('option:selected').text()+","+$(this).children('option:selected').val());
	});
	
	$("#searchBankName").blur(function(){
		var currnet_value = $(this).val();
		$("#bcjg").empty();
		$("#bcjg").append("<option value='0' selected='selected'></option>");
		var _cur_value = $("#jglx").children('option:selected').text();
		if(_cur_value == ""){
			for(var m=0;m<bankData.length;m++){
				if(bankData[m].name.indexOf(currnet_value)>=0){
					$("#bcjg").append("<option value='"+bankData[m].id+"'>"+bankData[m].name+"</option>");
				}
			}
		}else{
			for(var m=0;m<bankGroup[_cur_value].item.length;m++){
				if(bankGroup[_cur_value].item[m].name.indexOf(currnet_value)>=0){
					$("#bcjg").append("<option value='"+bankGroup[_cur_value].item[m].id+"'>"+bankGroup[_cur_value].item[m].name+"</option>");
				}
			}
		}
	});
	}

});

 
