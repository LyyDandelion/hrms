//页面初始化
    $(document).ready(function(){

    	$("body").append('<div id="doc_info" ><p></p></div>');
		$("#doc_info").hide().dialog({
			title:'<span class="position">文档详情</span>',
			autoOpen:false,
			width:320,
			//modal:true,
			position:['center',260]
		});
		
		function showDocMessage(text){
			$("#doc_info p").html(text);
			$("#doc_info").dialog("open");
		}
		
        
        //var data = [{"project":{"id":12,"dptId":4,"flag":0,"status":0,"name":"项目5","endDate":"2004-10-18","type":0,"beginDate":"2004-08-18","bankId":2},"doctypes":{"20":{"id":20,"desc":"分局立项时需要","name":"立项审批书"},"10":{"id":10,"desc":"总会、省局立项时需要","name":"上级通知"},"30":{"id":30,"desc":"其他立项时需要","name":"检查情况说明书"}},"doctypesList":[{"id":10,"desc":"总会、省局立项时需要","name":"上级通知"},{"id":20,"desc":"分局立项时需要","name":"立项审批书"},{"id":30,"desc":"其他立项时需要","name":"检查情况说明书"}],"docs":{"77":{"id":77,"dateTime":"2014-09-30 03:46:36","userId":43,"name":"wyq","path":"f://dir/wyq_test1","projectId":11,"typeId":20},"76":{"id":76,"dateTime":"2014-09-29 10:19:22","userId":43,"name":"sdl_doc_test","path":"f://dir/sdl_doc_test1","projectId":12,"typeId":10}},"department":{"id":4,"desc":"","name":"监管一科"},"prjRates":[],"bankName":"中国银行吴江支行","bank":{"id":2,"name":"中国银行吴江支行"},"ratingItems":[],"docsl":{"20":[{"id":77,"dateTime":"2014-09-30 03:46:36","name":"吴江农商行CRM项目功能需求大纲.xls","userId":43,"path":"f://dir/wyq_test1","projectId":11,"typeId":20},{"id":78,"dateTime":"2014-09-30 03:46:36","name":"吴江农村商业银行客户满意度回访项目方案-五稿-验收稿-公司银行部.ppt","userId":43,"path":"f://dir/wyq_test1","projectId":11,"typeId":20},{"id":79,"dateTime":"2014-09-30 03:46:36","name":"吴江农村商业银行CRM系统开发项目SOW.doc","userId":43,"path":"f://dir/wyq_test1","projectId":11,"typeId":20},{"id":80,"dateTime":"2014-09-30 03:46:36","name":"商机管理-验收-二稿.docx","userId":43,"path":"f://dir/wyq_test1","projectId":11,"typeId":20}],"10":[{"id":76,"dateTime":"2014-09-29 10:19:22","name":"吴江农村商业银行CRM系统开发项目SOW.doc","userId":43,"path":"f://dir/sdl_doc_test1","projectId":12,"typeId":10}]},"departmentName":"监管一科"}];
        
        var LiTemplate = $(".docUL li.template");
        var TrTemplate = $(".docUL li.template tr.template");
        var projectID = $("#projectID").val();
        $.ajax({
            url:'../ajax/ajax_listDocs.do',
            data:{projectId:projectID,random:Math.random()},
            type:'post',
            cache:false,
            dataType: 'json',
            success:function(data){
				var projectInfo = data[0].project;
                var docTypeInfo = data[0].doctypesList;
                var docsInfo = data[0].docsl;
                docTypeInfo = docTypeInfo.sort(SortByDocTypeID);
                //准备数据
                //拼装
                $.each(docTypeInfo,function(i,n){
                    var _cur_docTypeId = n.id;
                    var _cur_docTypeName = n.name;
                    var _currentDocType = LiTemplate.clone();
                    _currentDocType.find("tbody tr").remove();
                    _currentDocType.removeClass("template");
                    _currentDocType.attr("id","docList"+_cur_docTypeId);
                    _currentDocType.find("h5").html(_cur_docTypeName);
                    var _currentDocs = _currentDocType.find("tbody");
                    var _cus_Docs = docsInfo[_cur_docTypeId];
                    for(m=0;_cus_Docs!=undefined && m<_cus_Docs.length;m++){
                        addOneRowToDocType(_cus_Docs[m],_currentDocs);
                    }
                    _currentDocType.appendTo("ul.docUL");
                    RefreshTrBackColor(_cur_docTypeId);
                });
            },
            error:function(XMLHttpRequest, textStatus, errorThrown){
                //$(this).siblings(".input-notification").text("获取数据异常，请重试！").removeClass("info").removeClass("info").addClass("error");
            }
        });
		
        //排序
        function SortByDocTypeID(x,y){
            return x.id - y.id;
        }
        
        //更新背景色
        function RefreshTrBackColor(docTypeId){
            $('#docList' + docTypeId + ' tbody tr:even').addClass("alt-row");
            $('#docList' + docTypeId + ' tbody tr:odd').removeClass("alt-row");
        }
        
        //新增
        function addOneRowToDocType(docObj,currentDocs){
            var _cur_docId = docObj.id;
            var _cur_docName = docObj.name;
            var _cur_docWebName = docObj.webName;
            var _cur_docPath = docObj.path;
            var _cur_docTypeId = docObj.typeId;
            var _currentDoc = TrTemplate.clone();
            if(arguments.length==1){
                currentDocs = $('#docList' + _cur_docTypeId + ' tbody');
            }
            _currentDoc.attr("id","doc_"+_cur_docId);
            _currentDoc.find(".docId").text(_cur_docId);
            _currentDoc.find(".docPath").text(_cur_docName);
            _currentDoc.find(".docAction .view").attr("docId",_cur_docId).attr("docTypeId",_cur_docTypeId).attr("docPath",_cur_docPath).click(function(){
                var href = ".." + _cur_docPath + "/" + _cur_docWebName;
                $(this).attr("href", href);
            });
            _currentDoc.find(".docAction .docdetails").attr("docId",_cur_docId).attr("docTypeId",_cur_docTypeId).attr("docPath",_cur_docPath).click(function(){
//            	var href = "../dms/goviewdoc.do?&docId=" + _cur_docId;
//            	var href = $(this).attr("href") + _cur_docId;
//            	$(this).attr("href", href);
            	var url = "../ajax/ajax_viewDocVO.do";
            	$.ajax({
            		type: "post",
            		url : url,
            		data : {docId:_cur_docId},
            		cache:false,
                    dataType: 'json',
                    success:function(data){
                    	var project = data[0].project;
//                    	var prjDoc = data[0].prjDoc;
                    	var docType = data[0].docType;
                    	var doc = data[0].doc;
                    	var operator = data[0].operator;
//                    	var docName = '<p><label>文档名称：</label> <span class="showText">'+ doc.name + '</span></p>';
//                    	var prjName = '<p><label>项目名称：</label> <span class="showText">'+ project.name + '</span></p>';
//                    	var userName = '<p><label>上传人：</label> <span class="showText">'+ operator.userName + '</span></p>';
//                    	var dateTime = '<p><label>上传时间：</label> <span class="showText">'+ doc.dateTime + '</span></p>';
//                    	var docTypeName = '<p><label>文档类型：</label> <span class="showText">'+ docType.name + '</span></p>';
                    	
                    //	showDocMessage(docName + prjName + userName + dateTime + docTypeName);
                    	$("#userName").text(operator.userName);
                    	$("#docName").text(doc.name);
                    	$("#projectName").text(project.name);
                    	$("#mainCheckerName").text(project.mainCheckerName);
                    	$("#dateTime").text(doc.dateTime);
                    	$("#docTypeName").text(docType.name);
//                    	showDocMessage("项目名称：" + project.name + "<br/>" + "上传时间：" + doc.dateTime + "<br/>" + "文档类型：" + docType.name +"<br/>" + "文档名称：" + doc.name + "<br/>" + "上传人   ：" + operator.userName + "<br/>");
                    },
                    error:function(XMLHttpRequest, textStatus, errorThrown){
                        alert("异常");
                    }
            	});
//            	var currentDocs = $('#docList' + _cur_docTypeId + ' tbody tr');
//            	alert("docId :" + );
            	var currentDocs = $('#doc_' + _cur_docId);
            	var offsetY = currentDocs.offset().top - $(".review-tab").offset().top + currentDocs.height();
//            	var offsetY = $(this).offset().top + $(this).height();//+ $(this).outerHeight + "px";
//            	var posY = currentDocs.position().top;
//            	alert("offsetY: " + offsetY + " posY: " + posY);
//            	var offsetX = currentDocs.offset().left;
            	var posX = currentDocs.position().left;
//            	alert("offsetX:" + offsetX + "  posX:" + posX);
            	$(".docViewPanel").show().css("top",offsetY);
            	$(".docViewPanel").show().css("left",posX);
            	$(".docPanelClose a").click(function(){$(".docViewPanel").hide();return false;});
            	$(".docViewPanel").width($("#main-content").width()-640);
            	
            	
            	
            	return false;
            });
            
//            $('tbody tr').mouseover(function(){$(this).addClass("chooseRow");}).mouseout(function(){$(this).removeClass("chooseRow");}).click(function(){
//        		var offsetY = $(this).offset().top-$(".review-tab").offset().top + $(this).height();
//        		alert("offsetY:" + offsetY);
//        		$(".docViewPanel").show().css("top",offsetY);
//        		return false;
//        	});
//        	$(".docPanelClose a").click(function(){$(".docViewPanel").hide();return false;});
//        	$(".docViewPanel").width($("#main-content").width()-320);
            
            _currentDoc.appendTo(currentDocs);
        }
        
    });