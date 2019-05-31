<%@page language="java"  pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>考勤信息维护</title>
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
            <div style="height:26px;width:100%;text-indent:5px;font-weight:bold;font-family:Simsun;font-size:14px;line-height:26px;">考勤信息
            </div>
            <form id="userForm">
            <table id="userTbl" border="0" cellpadding="10" cellspacing="2" style="width:85%;height:95%;" align="right">
                <%--<tr>--%>
                    <%--<td style="text-align:right;width:90px;">工号：</td>--%>
                    <%--<td style="width:80%;">--%>
                        <%--<input id="dah" name="dah" class="mini-textbox" style="width:250px;" required="true" vtype="rangeChar:1,10;" value="${importData.dah}"/>--%>
                        <%--<input id="action" name="action" class="mini-hidden" value="${action}" />--%>

                    <%--</td>--%>
                <%--</tr>--%>
                <tr>
                    <td style="text-align:right;">工号：</td>
                    <td>
                        <input id="dah" name="dah" class="mini-combobox" textField="dah" required="true" valueField="dah"
                        style="width:250px;" url="<%=request.getContextPath()%>/ajax/user_getUsers_for_import.do"
                             value="${importData.dah}"/>
                    </td>
                    <%--onvaluechanged="levelChange"--%>
                </tr>
                <tr>
                    <td style="text-align:right;">月份：</td>
                    <td>
                        <input id="month" name="month" onvaluechanged="levelChange"  class="mini-textbox" style="width:250px;" required="true" value="${importData.month}"/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right;">病假天数：</td>
                    <td>
                        <input id="sickDays" name="sickDays" class="mini-textbox" style="width:250px;" required="true" value="${importData.sickDays}"  onvaluechanged="yearChange"/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right;">事假天数：</td>
                    <td>
                        <input id="compassionateDays" name="compassionateDays" class="mini-textbox" style="width:250px;" required="true" value="${importData.compassionateDays}"/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right;">迟到次数：</td>
                    <td>
                        <input id="lateTimes" name="lateTimes" class="mini-textbox" style="width:250px;" required="true" value="${importData.lateTimes}"/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right;">加班天数：</td>
                    <td>
                        <input id="overtimeDays" name="overtimeDays" class="mini-textbox" style="width:250px;" required="true" value="${importData.overtimeDays}"/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right;">补发：</td>
                    <td>
                        <input id="replenishment" name="replenishment" class="mini-textbox" style="width:250px;" required="true" value="${importData.replenishment}"/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right;">备注：</td>
                    <td>
                        <input id="note1" name="note1" class="mini-textarea" style="width:250px;" vtype="rangeChar:0,120" value="${importData.note1}"/>
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
        </div>

        <script type="text/javascript">
            mini.parse();
            $("#userBody").fadeTo("slow", 1);
            var paramAction = mini.get("action").getValue();
            if (mini.get("action").getValue() == "edit") {
                mini.get("dah").setAllowInput(false);
                mini.get("month").setAllowInput(false);
                mini.get("ygxm").setEnabled(false);
                mini.get("jgh").setEnabled(false);
                mini.get("sex").setEnabled(false);
                //mini.get("email").setEnabled(false);
                //mini.get("mobile").setEnabled(false);
                //mini.get("sfzh").setEnabled(false);
                mini.get("mjkkh").setEnabled(false);
                mini.get("gwdj").setEnabled(false);
            }

            function levelChange(){

                var dah=mini.get("dah").getValue();
                var month=mini.get("month").getValue();
                $.ajax({
                    url:"ajax/checkIsExsit.do",
                    data:{
                        dah:dah,
                        month:month
                    },
                    success:function(data){
                        if(data=="1")
                        {
                            alert("此员工已录入");
                            mini.get("dah").setValue("");
                            mini.get("month").setValue("");
                        }
                        console.log(JSON.stringify(data));
                    }
                })
                // mini.get("postSalary").setValue( mini.get("postLevel").getValue() * 1100 )
                // mini.get("award").setValue( mini.get("postLevel").getValue() * 1500 )
                // mini.get("trafficAllowrance").setValue( mini.get("postLevel").getValue() * 200 )
                // mini.get("telAllowrance").setValue( mini.get("postLevel").getValue() * 100 )
                // mini.get("lunchAllowrance").setValue( mini.get("postLevel").getValue() * 30 )
            }

            function yearChange(){
                mini.get("insurance").setValue( mini.get("workYear").getValue() * 200 )
                mini.get("endowmentInsurance").setValue( mini.get("workYear").getValue() * 320 )
                mini.get("medicalInsurance").setValue( mini.get("workYear").getValue() * 100 )
                mini.get("yearSalary").setValue( mini.get("workYear").getValue() * 25 )
            }

            // 标准方法接口定义
            function SetData(data) {
                paramAction = data.actionFlag;
                if (data.actionFlag == "add") {
                } else if (data.actionFlag == "edit" || data.actionFlag == "start") {
                    var form = new mini.Form("#userTbl");
                    // 跨页面传递的数据对象，克隆后才可以安全使用
                    data = mini.clone(data);
                    $.ajax({
                        url: "<%=request.getContextPath()%>/ajax/get_import.do",
                        data: { dah: data.dah,month:data.month },
                        type: "post",
                        dataType: 'text',
                        cache: false,
                        success: function (text) {
                            // debugger;
                            var o = mini.decode(text);
                            form.setData(o.importData);
                            form.setChanged(false);
                            mini.get("dah").setEnabled(false);
                            // mini.get("name").setValue(o.level);
                            mini.get("dah").setAllowInput(false);
                            mini.get("month").setAllowInput(false);
                            //mini.get("ygxm").setEnabled(false);
                            //mini.get("jgh").setEnabled(false);
                            //mini.get("sex").setEnabled(false);
                            //mini.get("sex").setEnabled(false);
                            //mini.get("email").setEnabled(false);
                            //mini.get("mobile").setEnabled(false);
                            //mini.get("sfzh").setEnabled(false);
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
                   //levelChange();
                    if (paramAction == "add") {
                        levelChange();
                        mini.confirm("是否确定创建该考勤数据？", "确定？",function(action) {
                            if (action == "ok") {
                                $.ajax({
                                    url: "<%=request.getContextPath()%>/ajax/import_addImport.do",
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
                            message = "是否确定更新员工考勤信息？";
                            alertMessage = "员工考勤更新成功！";
                        } else {
                            message = "是否确定启用该员工？";
                            alertMessage = "该员工已启用！";
                        }
                        mini.confirm(message, "确定？",function(action) {
                            if (action == "ok") {
                                $.ajax({
                                    url: "<%=request.getContextPath()%>/ajax/importData_updateData.do",
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