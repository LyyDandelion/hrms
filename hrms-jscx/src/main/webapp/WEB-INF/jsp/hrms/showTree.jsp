<%@page language="java"  pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>部门编辑</title>
        <script src="<%=request.getContextPath()%>/resources/scripts/boot.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath()%>/resources/scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
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
        <div id="userDiv" style="height:100%;border:0px solid #e0e0e0;" align="center">
            <table style="width:50%;table-layout:fixed;">
                <tr>
                    <td>
                        <ul id="jgTree" class="mini-tree" url="<%=request.getContextPath()%>/ajax/user_getJgList.do" style="width:200px;padding:5px;"
                            showTreeIcon="true" textField="jgmc" idField="jgh" parentField="sjjg" resultAsTree="false"
                            allowDrag="true" allowDrop="true" expandOnLoad="0">
                        </ul>
                    </td>
                </tr>
            </table>
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
/*            var paramAction = mini.get("action").getValue();
            if (mini.get("action").getValue() == "edit") {
                mini.get("jgmc").setAllowInput(false);
                mini.get("jgmc").setEnabled(false);
                mini.get("jgh").setEnabled(false);
            }*/

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