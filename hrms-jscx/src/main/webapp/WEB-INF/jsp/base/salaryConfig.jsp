<%@page language="java"  pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>岗位工资管理</title>
    <script src="<%=request.getContextPath()%>/resources/scripts/boot.js" type="text/javascript"></script>
    <link href="<%=request.getContextPath()%>/resources/css/miniui_style.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        body{
            overflow:hidden;
        }
    </style>
</head>
<body id="userBody" style="display: none">
<div class="mini-toolbar" style="padding:2px;border-bottom:0;">
    <table style="width:100%;table-layout:fixed;">
        <tr>
            <td style="width:120px">
                <!-- 原来是添加拼音功能 -->
            </td>
            <td style="width:120px">
                <a class="mini-button" style="width:150px" iconCls="icon-add" id="add" onclick="add()">岗位工资配置</a>
            </td>
            <%--<td style="width:60px;text-align:right;">院部：</td>--%>
            <%--<td style="width:35%">--%>
            <%--<input id="jgh" name="jgh" class="mini-treeselect" style="width:100%;" textField="jgmc"--%>
            <%--valueField="jgh" parentField="sjjg" expandOnLoad="0"--%>
            <%--allowInput="true">--%>
            <%--</input>--%>
            <%--</td>--%>
            <td style="width:60px;text-align:right;">岗位编码：</td>
            <td style="width:15%">
                <input id="enKey" name="dah" class="mini-textbox" style="width:100%;"/>
            </td>
            <td style="width:60px;text-align:right;">岗位名称：</td>
            <td style="width:15%">
                <input id="name" name="ygxm" class="mini-textbox" style="width:100%;"/>
            </td>
            <%--<td style="width:70px;text-align:right;">状态：</td>--%>
            <%--<td style="width:15%">--%>
            <%--<input id="flag" name="flag" class="mini-combobox" showNullItem="true" textField="text" valueField="id" style="width:100%;"/>--%>
            <%--</td>--%>
            <td style="width:100px"><a class="mini-button" id="search" onclick="search()" style="width:100%;">查询</a></td>
        </tr>
    </table>
</div>
<div class="mini-fit">
    <div id="salaryDatagrid" class="mini-datagrid"  allowAlternating="true" style="width:100%;height:100%;"
         url="<%=request.getContextPath()%>/ajax/config_getConfigs.do" allowResize="true" idField="dah" pageSize="50">
        <div property="columns">
            <div type="indexcolumn" width="60" headerAlign="center">序号</div>
            <div field="enKey" width="80" allowSort="true" align="center" headerAlign="center">岗位编码</div>
            <div field="name" width="80" allowSort="true" align="center" headerAlign="center">岗位名</div>
            <div field="postSalary" widthS="80" allowSort="true" align="center" headerAlign="center">岗位工资</div>
            <div field="award" width="80" allowSort="true" align="center" headerAlign="center">奖金</div>
            <div field="telAllowrance" width="80" allowSort="true" align="center" headerAlign="center">通讯补贴</div>
            <div field="trafficAllowrance" width="80" allowSort="true" align="center" headerAlign="center">交通补贴</div>
            <div field="lunchAllowrance" width="80" allowSort="true" align="center" headerAlign="center">用餐补贴</div>

            <div name="active" width="120" headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
        </div>
    </div>
</div>
<script type="text/javascript">
    mini.parse();
    $("#userBody").fadeTo("slow", 1);
    var editFlag = true;
    var pwdFlag = true;
    var delFlag = true;
    /* $(document).ready(function() {
         $.ajax({
             url: "<%=request.getContextPath()%>/ajax/salary_initSalaryList.do",
                    data:{id: "<%=request.getParameter("id")%>"},
                    type: "post",
                    async: false,
                    dataType: 'text',
                    success: function (text) {
                        var data = mini.decode(text);
                        // 绑定机构列表
                        var tree = mini.get("jgh");
                        tree.loadList(data.jgxx);
                        // 绑定用户状态
                        var flag = mini.get("flag");
                        flag.setData(data.ygzt);
                        if (data.editFlag == false) {
                            mini.get("add").setEnabled(false);
                        }
                        if (data.searchFlag == false) {
                            mini.get("search").setEnabled(false);
                        }
                        if (data.batchPinyinFlag == false) {
                            $("#batchAddPinyin").css("display","none");
                            mini.get("batchAddPinyin").setEnabled(false);
                        }
                        if (data.pinyinFlag == false) {
                            $("#addPinyin").css("display","none");
                            mini.get("addPinyin").setEnabled(false);
                        }
                        editFlag = data.editFlag;
                        delFlag = data.delFlag;
                        pwdFlag = data.pwdFlag;
                    }
                });
            }); */

    var grid = mini.get("salaryDatagrid");
    // mini.get("flag").setValue("0");
    // grid.load({"flag":"0"});
    grid.sortBy("dah", "ASC");

    // 操作列的生成
    function onActionRenderer(e) {
        var grid = e.sender;
        var record = e.record;
        var uid = record._uid;
        var rowIndex = e.rowIndex;

        var s = '';
        // 编辑权限设定
        if (editFlag) {
            s = s + '<a class="Edit_Button" href="javascript:editRow(\'' + uid + '\')">编辑</a>';
        } else {
            s = s + '<a class="Edit_Button" style="color:gray" href="#">编辑</a>';
        }

        return s;
    }

    // 查询按钮按下的事件
    function search() {
        // var jgh = mini.get("jgh").getValue();
        var enKey = mini.get("enKey").getValue();
        var name = mini.get("name").getValue();
        // var flag = mini.get("flag").getValue();
        // grid.load({ 'jgh': jgh, 'dah': dah, 'ygxm': ygxm, 'flag': flag });
        grid.load({ 'enKey': enKey, 'name': name});
    }

    // 创建员工操作按下的事件
    function add() {
        mini.open({
            url: "<%=request.getContextPath()%>/showSalaryConfigUpdPop.do",
            title: "配置", width: 800, height: 500,
            onload: function () {
                var iframe = this.getIFrameEl();
                var data = { actionFlag: "add" };
                iframe.contentWindow.SetData(data);
            },
            ondestroy: function (action) {
                if (action == "ok") {
                    grid.reload();
                }
            }
        });
    }

    // 密码重置操作按下的事件
    function resetPwd(row_uid) {
        var row = grid.getRowByUID(row_uid);
        if (row) {
            mini.confirm("是否确定重置密码？", "确定？", function(action) {
                if (action == "ok") {
                    $.ajax({
                        url: "<%=request.getContextPath()%>/ajax/user_resetPwd.do",
                        data: { dah: row.dah },
                        type: "post",
                        dataType: 'text',
                        success: function (text) {
                            if (text == "SUCCESS") {
                                mini.alert("密码重置成功");
                            }
                        }
                    });
                }
            });
        }
    }

    // 编辑操作按下的事件
    function editRow(row_uid) {
        var row = grid.getRowByUID(row_uid);
        if (row) {
            mini.open({
                url: "<%=request.getContextPath()%>/showSalaryConfigUpdPop.do",
                title: "编辑配置信息", width: 800, height: 640,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = { actionFlag: "edit", enKey: row.enKey };
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {
                    if (action == "ok") {
                        grid.reload();
                    }
                }
            });
        }
    }

    // 启用操作按下的事件
    function addRow(row_uid) {
        var row = grid.getRowByUID(row_uid);
        if (row) {
            mini.open({
                url: "<%=request.getContextPath()%>/showUserUpdPop.do",
                title: "启用员工", width: 800, height: 600,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = { actionFlag: "start", dah: row.dah };
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {
                    if (action == "ok") {
                        grid.reload();
                    }
                }
            });
        }
    }

    // 停用操作按下的事件
    function delRow(row_uid) {
        var row = grid.getRowByUID(row_uid);
        if (row) {
            if (row.dah == "admin") {
                mini.alert("超级管理员不能停用！");
                return;
            }
            mini.confirm("是否确定停用该员工？", "确定？", function(action) {
                if (action == "ok") {
                    $.ajax({
                        url: "<%=request.getContextPath()%>/ajax/user_deleteUser.do",
                        type: "post",
                        data: {dah : row.dah},
                        dataType: 'text',
                        success: function (text) {
                            if (text == "SUCCESS") {
                                mini.alert("该员工已停用", "提醒", function(action) { grid.reload(); });
                            }
                        }
                    });
                }
            });
        }
    }
    // 批量添加拼音
    function batchAddPinyin() {
        var loading = mini.loading("正在添加拼音，请稍等...", "Loading");
        $.ajax({
            type: "post",
            url: "<%=request.getContextPath()%>/ajax/user_batchAddPinyin.do",
            dataType: 'text',
            success: function(result) {
                mini.hideMessageBox(loading);
                mini.alert(result);
            }
        })
    }
    // 选择用户添加拼音
    function addPinyin() {
        var selectedRow = grid.getSelected();
        if(selectedRow) {
            $.ajax({
                type: "post",
                url: "<%=request.getContextPath()%>/ajax/user_addPinyin.do",
                data:{dah:selectedRow.dah,ygxm:selectedRow.ygxm},
                dataType: 'text',
                success: function(result) {
                    mini.alert(result);
                }
            })
        } else {
            mini.alert("请先选中一行！");
        }
    }

    function beforenodeselect(e) {
        //禁止选中父节点
        if (e.isLeaf == false) e.cancel = true;
    }
</script>
</body>
</html>