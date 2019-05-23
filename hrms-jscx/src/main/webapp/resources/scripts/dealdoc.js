//页面初始化
    $(document).ready(function(){
    	//文件上传前验证数据有效性并更改参数
        $("#uploadAndThenSubmit").click(function(){
            //判断用户是否有改操作权限
            $.ajax({
                url:'../ajax/ajax_chkRole.do',
                data:{q:"upload"},
                type:'post',
                cache:false,
                dataType: 'text',
                success:function(data){
                    if( data != "true") {
                        $(".uploadspan").text("您没有上传文档的权限！").show();
                        return false;
                    }
                },
                error:function(XMLHttpRequest, textStatus, errorThrown){
                    //$(this).siblings(".input-notification").text("获取数据异常，请重试！").removeClass("info").removeClass("info").addClass("error");
                }
            });
            if($(".uploadify-queue-item").length == 0){
                $(".uploadspan").text("您没有选择任何文件！").show();
                return false;
            }
            if($("#docTypeSelect").val()== ""){
                $(".uploadspan").text("您没有选择文档类型！").show();
                return false;
            }
            $(".uploadspan").text("").hide();
            $("#file_upload1").uploadify('settings','formData',{ 'docTypeId': $("#docTypeSelect").val(),'projectId': $("#projectID").val() });
            $("#file_upload1").uploadify('upload','*');
            return false;
        });
        
        //初始化上传控件
        $('.file_upload').uploadify({
                'swf'      : '/osidms/resources/uploadify/uploadify.swf',
                'uploader' : 'dms/upload.do',
                'fileTypeExts'  : '*.doc;*.xls;*.ppt;*.docx;*.xlsx;*.pptx;*.txt;*.jpg;*.bmp;*.jpg;*.jpeg;*.pdf;*.png;*.rar;*.zip;*.gd;',
                'fileTypeDesc' : '可选文件（txt,doc,docx,xls,xlsx,ppt,pptx,jpg,bmp,jpg,jpeg,pdf,png,rar,zip,gd）',
                'buttonText': '选择文件',
                'queueSizeLimit':'10',
                'removeCompleted':true,
                'auto':false,
                'height':26,
                'queueID':"uploadQuene",
                'dataType': 'json',
                //'fileSizeLimst':50*1024*1024,
                'fileSizeLimit':'50MB',
                'onUploadStart': function(file){
                    //$("#file_upload").uploadify("settings", "formData", { 'docID': $("#docTypeSelect").val() }); 
                },
                'onUploadSuccess': function(file, data, response){
                	if(data.length>900){
                		showMessage("文件上传失败，可能由于文件太大或者网路原因！");
                	}else{
                    data = eval(data);
                    //alert('The file ' + file.name + ' was successfully uploaded with a response of ' + response + ':' + data);
                    //alert(data[0]);
                    	addOneRowToDocType(data[0]);
                	}
                    
                },
                'onError':function (event,queueId,fileObj,errorObj){
                	showMessage("文件上传失败，可能由于文件太大或者网路原因！");
                }
        });
    	
        //发起JSON向服务器请求页面初始化数据
        
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
                //清空当前所有数据
                //$("ul.docUL").empty();
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
            _currentDoc.find(".docAction .remove").attr("docId",_cur_docId).attr("docTypeId",_cur_docTypeId).click(function(){
                removeOneRowByDocID(_cur_docTypeId,$(this).attr("docId"));
            });
            _currentDoc.find(".docAction .view").attr("docId",_cur_docId).attr("docTypeId",_cur_docTypeId).attr("docPath",_cur_docPath).click(function(){
                //showDocByDocID(_cur_docTypeId,$(this).attr("docId"));
                var href = ".." + _cur_docPath + "/" + _cur_docWebName;
                $(this).attr("href", href)
            });
            _currentDoc.appendTo(currentDocs);
        }
        
        //删除一行
        function removeOneRowByDocID(docTypeID,docID){
            if(!confirm("确认删除?")) {
                return;
            }
            $.ajax({
                url:'../dms/deldoc.do',
                data:{docId:docID},
                type:'post',
                cache:false,
                dataType: 'text',
                success:function(data){
                    if ( data == "true" ) {
                        $("#doc_"+docID).remove();
                        RefreshTrBackColor(docTypeID);
                    } else {
                        showMessage(data);
                    }
                },
                error:function(XMLHttpRequest, textStatus, errorThrown){
                    showMessage("操作失败或权限不够" + textStatus);
                    //$(this).siblings(".input-notification").text("获取数据异常，请重试！").removeClass("info").removeClass("info").addClass("error");
                }
            });
        }
    });