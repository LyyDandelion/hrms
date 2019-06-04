<%@page language="java"  pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>岗位工资信息维护</title>
    <script src="<%=request.getContextPath()%>/resources/scripts/boot.js" type="text/javascript"></script>
    <link href="<%=request.getContextPath()%>/resources/css/miniui_style.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        .mini-radiobuttonlist table label{
            width:70px;
        }
        /* body{
           overflow:hidden;
       } */
    </style>
</head>
<body id="userBody" style="display: none">
<div id="userDiv" style="height:100%;border:0px solid #e0e0e0;">
    <div style="height:26px;width:100%;text-indent:5px;font-weight:bold;font-family:Simsun;font-size:14px;line-height:26px;">岗位信息
    </div>
    <form id="userForm">
        <table id="userTbl" border="0" cellpadding="10" cellspacing="2" style="width:85%;height:95%;" align="right">
            <tr style="display: none;">
                <td style="text-align:right;">岗位编码：</td>
                <td>
                    <input id="enKey" name="enKey" class="mini-textbox"  onvaluechanged="levelChange" style="width:250px;" required="true" value="${condition.enKey}"/>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;">岗位：</td>
                <td>
                    <input id="name" name="name" class="mini-combobox" textField="name" valueField="enKey"
                           style="width:250px;" url="<%=request.getContextPath()%>/ajax/user_getGwList.do" value="${condition.name}"
                           onvaluechanged="levelChange"/>
                </td>

            </tr>
                <tr>
                    <td style="text-align:right;">岗位工资：</td>
                    <td>
                        <input id="postSalary" name="postSalary" class="mini-textbox" style="width:250px;" required="true" value="${condition.post_salary}"/>
                    </td>
                </tr>
                <%--<tr>--%>
                    <%--<td style="text-align:right;">工龄：</td>--%>
                    <%--<td>--%>
                        <%--<input id="workYear" name="workYear" class="mini-textbox" style="width:250px;" required="true" value="${userInfo.work_year}"  onvaluechanged="yearChange"/>--%>
                    <%--</td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                    <%--<td style="text-align:right;">工龄工资：</td>--%>
                    <%--<td>--%>
                        <%--<input id="yearSalary" name="yearSalary" class="mini-textbox" style="width:250px;" required="true" value="${userInfo.year_salary}"/>--%>
                    <%--</td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                    <%--<td style="text-align:right;">浮动工资：</td>--%>
                    <%--<td>--%>
                        <%--<input id="floatSalary" name="floatSalary" class="mini-textbox" style="width:250px;" required="true" value="${userInfo.float_salary}"/>--%>
                    <%--</td>--%>
                <%--</tr>--%>
                <tr>
                    <td style="text-align:right;">奖金：</td>
                    <td>
                        <input id="award" name="award" class="mini-textbox" style="width:250px;" required="true" value="${condition.award}"/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right;">通讯补贴：</td>
                    <td>
                        <input id="telAllowrance" name="telAllowrance" class="mini-textbox" style="width:250px;" required="true" value="${condition.tel_allowrance}"/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right;">交通补贴：</td>
                    <td>
                        <input id="trafficAllowrance" name="trafficAllowrance" class="mini-textbox" style="width:250px;" required="true" value="${condition.traffic_allowrance}"/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right;">用餐补贴：</td>
                    <td>
                        <input id="lunchAllowrance" name="lunchAllowrance" class="mini-textbox" style="width:250px;" required="true" value="${condition.lunch_allowrance}"/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right;">备注：</td>
                    <td>
                        <input id="bz" name="bz" class="mini-textarea" style="width:250px;" vtype="rangeChar:0,120" value="${condition.bz}"/>
                    </td>
                </tr>
            <tr>
                <td>
                </td>
                <td >
                    <a class="mini-button" id="save" onclick="save" style="margin-left:60px;">保存</a>
                    <a class="mini-button" onclick="closeTab">取消</a>
                </td>
            </tr>
        </table>
    </form>
    <a style="display: none;"  id="action" style="margin-left:60px;"></a>
</div>

<script type="text/javascript">
    mini.parse();
    $("#userBody").fadeTo("slow", 1);
    var paramAction = mini.get("action").getValue();
    if (mini.get("action").getValue() == "edit") {
        mini.get("enKey").setAllowInput(false);
        mini.get("name").setAllowInput(false);
        mini.get("name").setEnabled(false);
    }

    /**
     * 校验编码
     */
    function levelChange(){
        var enKey=mini.get("name").getValue();
        $("#enKey").val(enKey);
        $.ajax({
            url:"ajax/configEnKeyIsExsit.do",
            data:{
                enKey:enKey
            },
            success:function(data){
                if(data=="1")
                {
                    alert("此岗位配置已存在");
                    mini.get("enKey").setValue("");
                    mini.get("name").setValue("");
                }
                console.log(JSON.stringify(data));
            }

        })
    }

    function yearChange(){
        mini.get("insurance").setValue( mini.get("workYear").getValue() * 200 )
        mini.get("endowmentInsurance").setValue( mini.get("workYear").getValue() * 320 )
        mini.get("medicalInsurance").setValue( mini.get("workYear").getValue() * 100 )
        mini.get("yearSalary").setValue( mini.get("workYear").getValue() * 25 )
    }

    // 标准方法接口定义
    function SetData(data) {
        debugger;
        paramAction = data.actionFlag;
        if (data.actionFlag == "add") {
        } else if (data.actionFlag == "edit" || data.actionFlag == "start") {
            var form = new mini.Form("#userTbl");
            // 跨页面传递的数据对象，克隆后才可以安全使用
            data = mini.clone(data);
            $.ajax({
                url: "<%=request.getContextPath()%>/ajax/config_get.do",
                data: { enKey: data.enKey },
                type: "post",
                dataType: 'text',
                cache: false,
                success: function (text) {
                    var o = mini.decode(text);
                    form.setData(o.condition);
                    form.setChanged(false);
                    mini.get("enKey").setAllowInput(false);
                    mini.get("name").setAllowInput(false);
                    mini.get("name").setEnabled(false);
                    mini.get("action").setValue('edit');
                    mini.parse();
                }
            });
        }
    }

    // 保存该画面数据
    function save() {
        var form = new mini.Form("#userTbl");
        form.validate();
        if (form.isValid() == true) {
            if (paramAction == "add") {
                mini.confirm("是否确定创建该数据？", "确定？",function(action) {
                    if (action == "ok") {
                        $.ajax({
                            url: "<%=request.getContextPath()%>/ajax/config_add.do",
                            type: "post",
                            dataType: 'text',
                            data: $("#userForm").serializeArray(),
                            success: function (result) {
                                if (result == "SUCCESS") {
                                    mini.alert("创建成功！", "提醒", function(action) { CloseWindow("ok");});
                                } else {
                                    mini.alert("已创建，不能重复创建！");

                                }
                            }
                        });
                    }
                });
            } else if (paramAction == "edit" || paramAction == "start") {
                var i=$("#userForm").serializeArray();
                console.log("test:"+JSON.stringify(i))
                var message;
                var alertMessage;
                if (paramAction == "edit") {
                    message = "是否确定更新该岗位信息？";
                    alertMessage = "岗位更新成功！";
                } else {
                    message = "是否确定启用该员工？";
                    alertMessage = "该员工已启用！";
                }
                mini.confirm(message, "确定？",function(action) {
                    if (action == "ok") {
                        $.ajax({
                            url: "<%=request.getContextPath()%>/ajax/config_update.do",
                            type: "post",
                            dataType: 'text',
                            data: $("#userForm").serializeArray(),
                            success: function (result) {
                                if (result == "SUCCESS") {
                                    mini.alert(alertMessage, "提醒", function(action) { CloseWindow("ok");});
                                }
                            }
                        });
                    }
                });
            }

        }else{
            form.getErrors()[0].focus();
        }
    }

    // 关闭该窗口
    function closeTab() {
        CloseWindow("cancel");
    }

    // 关闭窗口
    function CloseWindow(action) {
        if (window.CloseOwnerWindow) {
            return window.CloseOwnerWindow(action);
        } else {
            window.close();
        }
    }

    // 机构控件清空
    function onCloseClick(e) {
        var obj = e.sender;
        obj.setText("");
        obj.setValue("");
    }


</script>
</body>
</html>