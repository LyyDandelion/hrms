<%@page language="java"  pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>角色管理</title>
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
                    <td style="width:85%;">
                        <a class="mini-button" id="add" onclick="add()">增加部门</a>
                        <a class="mini-button" id="edit" onclick="edit()">编辑部门</a>
                        <a class="mini-button" id="remove" onclick="remove()">删除部门</a>
                    </td>
                    <td style="width:90px;text-align:right;">部门名称：</td>
                    <td style="width:15%;">
                        <input id="jgmc" class="mini-textbox" emptyText="请输入部门名称" style="width:100%;" onenter="onKeyEnter"/>
                    </td>
                    <td style="width:70px;">
                        <a class="mini-button" id="search" onclick="search()">查询</a>
                    </td>
                </tr>
            </table>
        </div>
        <div class="mini-fit">  
            <div id="roleDatagrid" class="mini-datagrid"  allowAlternating="true" style="width:100%;height:100%;"
            url="<%=request.getContextPath()%>/ajax/getDeptList.do" allowResize="true" idField="id" pageSize="50">
                <div property="columns">
                    <div type="indexcolumn" headerAlign="center" align="center"  width="70">序号</div>
                    <div field="jgmc" width="30%" headerAlign="center" align="center"  allowSort="false">部门名称</div>
                    <div field="jgh" width="30%"  headerAlign="center" align="center" allowSort="false">部门编号</div>
                    <div field="superDept" width="30%" headerAlign="center" align="center" allowSort="false" dateFormat="yyyy-MM-dd HH:mm:ss">上级部门</div>
                    <div field="sjjg" width="30%" headerAlign="center" align="center" allowSort="false">上级部门编号</div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            mini.parse();
            $("#userBody").fadeTo("slow", 1);
            $(document).ready(function() {
            /*    $.ajax({
                    url: "<%=request.getContextPath()%>/ajax/role_initRoleList.do",
                    data:{id: "<%=request.getParameter("id")%>"},
                    type: "post",
                    dataType: 'text',
                    success: function (text) {
                        var data = mini.decode(text);
                        if (data.delFlag == false) {
                            mini.get("remove").setEnabled(false);
                        }
                        if (data.editFlag == false  ) {
                            mini.get("add").setEnabled(false);
                            mini.get("edit").setEnabled(false);
                        }
                    }
                });*/
            });

            var grid = mini.get("roleDatagrid");  
            grid.load();
            grid.sortBy("id", "ASC");

            function onKeyEnter(e) {
                search();
            }

            // 查询按钮按下的事件
            function search() {
                var name = mini.get("jgmc").getValue();
                grid.load({ 'jgmc': name });
            }

            // 增加角色
            function add() {
                mini.open({
                    url: "<%=request.getContextPath()%>/showDeptUpdPop.do",
                    title: "新增部门", width: 600, height: 360,
                    onload: function () {
                        var iframe = this.getIFrameEl();
                        var data = { actionFlag: "add"};
                        iframe.contentWindow.SetData(data);
                    },
                    ondestroy: function (action) {
                        if (action == "ok") {
                            grid.reload();
                        }
                    }
                });
            }

            // 编辑角色
            function edit() {
                var row = grid.getSelected();
                if (row) {
                    mini.open({
                        url: "<%=request.getContextPath()%>/showDeptEditPop.do",
                        title: "编辑部门", width: 600, height: 360,
                        onload: function () {
                            var iframe = this.getIFrameEl();
                            var data = { actionFlag: "edit", jgmc: row.jgmc, jgh: row.jgh,sjjg:row.sjjg};
                            iframe.contentWindow.SetData(data);
                            
                        },
                        ondestroy: function (action) {
                            if (action == "ok") {
                                grid.reload();
                            }
                        }
                    });
                    
                } else {
                    mini.alert("请选中一条记录");
                }
            }
            
            // 批量编辑角色
            function piLiangEdit() {
                    mini.open({
                        url: "<%=request.getContextPath()%>/showPiLiangRoleUpd.do",
                        title: "批量编辑角色", width: 600, height: 360,                        
                          onload: function () {
                           var iframe = this.getIFrameEl();
                            var data = { action: "piLiangEdit"};
                            iframe.contentWindow.SetData(data);
                        },
                        ondestroy: function (action) {
                            if (action == "ok") { 
                                grid.reload(); 
                             }
                        }
                    });
                    
            }

            // 删除角色
            function remove() {
                var rows = grid.getSelecteds();
                if (rows.length > 0) {
                    mini.confirm("是否确定删除选中记录？", "确定？", function(action) {
                    if (action == "ok") {
                        if(rows[0].flag == 1){
                            grid.reload();
                            mini.alert("该部门不能被删除！");
                            return;
                        }
                        var jgh = rows[0].jgh;
                            $.ajax({
                                url: "<%=request.getContextPath()%>/ajax/deleteDept.do",
                                type: "post",
                                data: { jgh: jgh },
                                dataType: 'text',
                                success: function (text) {
                                    if (text == "SUCCESS") {
                                        mini.alert("删除成功", "提醒", function(e) {
                                            grid.reload();
                                        });
                                    } else {
                                        grid.reload();
                                        mini.alert("该部门删除失败！");
                                    }
                                }
                            });
                    }
                    });
                } else {
                    mini.alert("请选中一条记录");
                }
            }
        </script>
    </body>  
</html>  