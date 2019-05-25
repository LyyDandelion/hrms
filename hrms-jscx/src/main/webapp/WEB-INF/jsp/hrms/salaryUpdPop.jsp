<%@page language="java"  pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>工资基金信息维护</title>
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
            <div style="height:26px;width:100%;text-indent:5px;font-weight:bold;font-family:Simsun;font-size:14px;line-height:26px;">工资基金信息
            </div>
            <form id="userForm">
            <table id="userTbl" border="0" cellpadding="10" cellspacing="2" style="width:85%;height:95%;" align="right">
                <tr>
                    <td style="text-align:right;width:90px;">工号：</td>
                    <%--<td style="width:80%;">--%>
                        <%--<input id="dah" name="dah" class="mini-textbox" style="width:250px;" required="true" vtype="rangeChar:1,10;" value="${userInfo.dah}"/>--%>
                        <%--<input id="action" name="action" class="mini-hidden" value="${action}" />--%>

                    <%--</td>--%>
                    <td>
                        <input id="dah" name="dah" class="mini-combobox" textField="dah" valueField="dah"
                               style="width:250px;" url="<%=request.getContextPath()%>/ajax/salary_getDahsBychoice.do"
                               value="${importData.dah}"/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right;">岗位等级：</td>
                    <td>
                        <input id="postLevel" name="postLevel" class="mini-combobox" textField="name" valueField="enKey"
                        style="width:250px;" url="<%=request.getContextPath()%>/ajax/user_getGwList.do" value="${userInfo.post_level}"
                            onvaluechanged="levelChange"/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right;">岗位工资：</td>
                    <td>
                        <input id="postSalary" name="postSalary" class="mini-textbox" style="width:250px;" required="true" value="${userInfo.post_salary}"/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right;">工龄：</td>
                    <td>
                        <input id="workYear" name="workYear" class="mini-textbox" style="width:250px;" required="true" value="${userInfo.work_year}"  onvaluechanged="yearChange"/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right;">工龄工资：</td>
                    <td>
                        <input id="yearSalary" name="yearSalary" class="mini-textbox" style="width:250px;" required="true" value="${userInfo.year_salary}"/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right;">浮动工资：</td>
                    <td>
                        <input id="floatSalary" name="floatSalary" class="mini-textbox" style="width:250px;" required="true" value="${userInfo.float_salary}"/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right;">奖金：</td>
                    <td>
                        <input id="award" name="award" class="mini-textbox" style="width:250px;" required="true" value="${userInfo.award}"/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right;">通讯补贴：</td>
                    <td>
                        <input id="telAllowrance" name="telAllowrance" class="mini-textbox" style="width:250px;" required="true" value="${userInfo.tel_allowrance}"/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right;">交通补贴：</td>
                    <td>
                        <input id="trafficAllowrance" name="trafficAllowrance" class="mini-textbox" style="width:250px;" required="true" value="${userInfo.traffic_allowrance}"/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right;">用餐补贴：</td>
                    <td>
                        <input id="lunchAllowrance" name="lunchAllowrance" class="mini-textbox" style="width:250px;" required="true" value="${userInfo.lunch_allowrance}"/>
                    </td>
                </tr>
                <%--<tr>--%>
                    <%--<td style="text-align:right;">社保：</td>--%>
                    <%--<td>--%>
                        <%--<input id="insurance" name="insurance" class="mini-textbox" style="width:250px;" required="true" value="${userInfo.insurance}"/>--%>
                    <%--</td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                    <%--<td style="text-align:right;">养老保险：</td>--%>
                    <%--<td>--%>
                        <%--<input id="endowmentInsurance" name="endowmentInsurance" class="mini-textbox" style="width:250px;" required="true" value="${userInfo.endowment_insurance}"/>--%>
                    <%--</td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                    <%--<td style="text-align:right;">医疗保险：</td>--%>
                    <%--<td>--%>
                        <%--<input id="medicalInsurance" name="medicalInsurance" class="mini-textbox" style="width:250px;" required="true" value="${userInfo.medical_insurance}"/>--%>
                    <%--</td>--%>
                <%--</tr>--%>
                <tr>
                    <td style="text-align:right;">备注：</td>
                    <td>
                        <input id="bz" name="bz" class="mini-textarea" style="width:250px;" vtype="rangeChar:0,120" value="${userInfo.bz}"/>
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
            $.ajax({
                url:"<%=request.getContextPath()%>/ajax/salary_getDahsBychoice.do",
                success:function (data) {
                    console.log("接收："+JSON.stringify(data));
                }
            })

            mini.parse();
            $("#userBody").fadeTo("slow", 1);
            var paramAction = mini.get("action").getValue();
            if (mini.get("action").getValue() == "edit") {
                mini.get("dah").setAllowInput(false);
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
                mini.get("postSalary").setValue( mini.get("postLevel").getValue() * 1100 )
                mini.get("award").setValue( mini.get("postLevel").getValue() * 1500 )
                mini.get("trafficAllowrance").setValue( mini.get("postLevel").getValue() * 200 )
                mini.get("telAllowrance").setValue( mini.get("postLevel").getValue() * 100 )
                mini.get("lunchAllowrance").setValue( mini.get("postLevel").getValue() * 30 )
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
                        url: "<%=request.getContextPath()%>/ajax/salary_getSalary.do",
                        data: { dah: data.dah },
                        type: "post",
                        dataType: 'text',
                        cache: false,
                        success: function (text) {
                            var o = mini.decode(text);
                            form.setData(o.salary);
                            form.setChanged(false);
                            mini.get("dah").setEnabled(false);
                            mini.get("dah").setValue(o.salary.dah);
                            mini.get("dah").setAllowInput(false);
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
                var s=$("#userForm").serializeArray();

                console.log(JSON.stringify(s))
                var form = new mini.Form("#userTbl");
                form.validate();
                if (form.isValid() == true) {
                    if (paramAction == "add") {
                        mini.confirm("是否确定创建该工资基金？", "确定？",function(action) {
                            if (action == "ok") {
                                $.ajax({
                                    url: "<%=request.getContextPath()%>/ajax/salary_addSalary.do",
                                    type: "post",
                                    dataType: 'text',
                                    data: $("#userForm").serializeArray(),
                                    success: function (result) {
                                        if (result == "SUCCESS") {
                                            mini.alert("工资基金创建成功！", "提醒", function(action) { CloseWindow("ok");});
                                        } else {
                                            mini.alert("该工资基金已创建，不能重复创建！");

                                        }
                                    }
                                });
                            }
                        });
                    } else if (paramAction == "edit" || paramAction == "start") {
                        var message;
                        var alertMessage;
                        if (paramAction == "edit") {
                            message = "是否确定更新固定工资信息？";
                            alertMessage = "员工固定工资信息更新成功！";
                        } else {
                            message = "是否确定启用该员工？";
                            alertMessage = "该员工已启用！";
                        }
                        mini.confirm(message, "确定？",function(action) {
                            if (action == "ok") {
                                $.ajax({
                                    url: "<%=request.getContextPath()%>/ajax/salary_updateSalary.do",
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