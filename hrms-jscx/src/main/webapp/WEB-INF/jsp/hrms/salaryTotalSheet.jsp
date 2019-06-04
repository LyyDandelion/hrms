<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>数据分析信息</title>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                + path;
    %>
    <c:set var="path" value="<%=request.getContextPath()%>"></c:set>

    <!-- js引入 -->
    <script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/zeroModal/zeroModal.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/handle.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/add-update.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/echarts/echarts.js"></script>
    <script src="<%=request.getContextPath()%>/resources/scripts/boot.js" type="text/javascript"></script>
    <link href="<%=request.getContextPath()%>/resources/css/miniui_style.css" type="text/css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/resources/js/zeroModal/zeroModal.css" />
    <style type="text/css">
        .myTable-container {
            width: 800px;
            height: 430px;
        }
    </style>
</head>
<body>



<div class="container" >
    <%--<ul id="myTab" class="nav nav-tabs">--%>
        <%--<li class="active"><a href="#tab1" data-toggle="tab">月度工资统计</a></li>--%>
        <%--&lt;%&ndash;<li><a href="#tab2" data-toggle="tab">部门工资统计</a></li>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<li><a href="#tab3" data-toggle="tab">月度工资统计</a></li>&ndash;%&gt;--%>
    <%--</ul>--%>
   <div class="row">
       <div id="myTabContent" >
           <div class="active" id="tab1">
               <div id="tab1-container" class="myTable-container"></div>
           </div>
           <%--<div class="tab-pane " id="tab2">--%>
           <%--<div id="tab2-container" class="myTable-container"></div>--%>
           <%--</div>--%>
           <%--<div class="tab-pane " id="tab3">--%>
           <%--<div id="tab3-container" class="myTable-container"></div>--%>
           <%--</div>--%>
       </div>
   </div>
        <div class="row">

            <%--<ul id="myTab2" class="nav nav-tabs">--%>
            <%--&lt;%&ndash;<li class="active"><a href="#tab1" data-toggle="tab">学科试卷分数分析</a></li>&ndash;%&gt;--%>
            <%--<li class="active"><a href="#tab2" data-toggle="tab">部门工资统计</a></li>--%>
            <%--&lt;%&ndash;<li><a href="#tab3" data-toggle="tab">学科最低分</a></li>&ndash;%&gt;--%>
            <%--</ul>--%>
            <div id="myTabContent" >
                <%--<div class="tab-pane  active" id="tab1">--%>
                <%--<div id="tab1-container" class="myTable-container"></div>--%>
                <%--</div>--%>
                <div  id="tab2">
                    <div id="tab2-container" class="myTable-container"></div>
                </div>
                <%--<div class="tab-pane " id="tab3">--%>
                <%--<div id="tab3-container" class="myTable-container"></div>--%>
                <%--</div>--%>
            </div>
        </div>

</div>
<script>
    var $tab1 = document.getElementById('tab1-container');
    var $tab2 = document.getElementById('tab2-container');
    var $tab3 = document.getElementById('tab3-container');
    /* 折线图 */
    //月度分析
    var courseAvgInfo = {
        title : {
            text : '月度分析',
        },
        tooltip : {
            trigger : 'axis',

        },
        toolbox : {
            show : true,
            feature : {
                mark : {
                    show : true
                },
                dataView : {
                    show : true,
                    readOnly : false
                },
                magicType : {
                    show : true,
                    type : [ 'line', 'scatter','bar' ]
                },
                restore : {
                    show : true
                },
                saveAsImage : {
                    show : true
                }
            }
        },
        dataZoom : [ {
            type : 'slider',//显示拖拽功能
        } ],
        xAxis : {
            type : 'category',
            data : []
        },
        yAxis : {
            type : 'value'
        },
        series : [ {
            name : "本月实发总工资",
            data : [],
            type : 'line',
            smooth : true,
            color : [ 'green' ]
        }
        // , {
        //     name : "todo",
        //     data : [],
        //     type : 'scatter',
        //     smooth : true,
        //     color : [ 'red' ]
        // }
            // ,
        //     {
        //         name : "",
        //         data : [],
        //         type : 'scatter',
        //         smooth : true,
        //         color : [ '#00a2ee' ]
        //     },
        //     {
        //         name : "",
        //         data : [],
        //         type : 'line',
        //         smooth : false,
        //         stack:"总量",
        //         itemStyle:{
        //             normal:{
        //                 lineStyle:{
        //                     type:"dotted"
        //                 }
        //             }
        //         },
        //         color : [ '#aaa2ee' ]
        //     }
        ]
    };
    //
    var courseStdInfo = {
        title : {
            text : '部门年度统计',
        },
        tooltip : {
            trigger : 'axis',

        },
        dataZoom : [ {
            type : 'slider',//显示拖拽功能
        } ],
        toolbox : {
            show : true,
            feature : {
                mark : {
                    show : true
                },
                dataView : {
                    show : true,
                    readOnly : false
                },
                magicType : {
                    show : true,
                    type : [ 'line', 'scatter','bar' ]
                },
                restore : {
                    show : true
                },
                saveAsImage : {
                    show : true
                }
            }
        },
        xAxis : {
            type : 'category',
            data : [],
        },
        yAxis : {
            type : 'value'
        },
        series : [ {
            name:"部门本年总工资",
            data : [],
            type : 'line',
            color : [ '#FF0000' ]
        }
        // ,
        //     {
        //         name:"样本标准差",
        //         data : [],
        //         type : 'line',
        //         color : [ '#0af0f1' ]
        //     },
        //     {
        //         name:"平均分",
        //         data : [],
        //         type : 'bar',
        //         color : [ '#61ce6e' ]
        //     }
        ]
    };
    var courseExamInfo = {
        title : {
            text : '学科试卷总体分析',
        },
        tooltip : {
            trigger : 'axis',

        },dataZoom : [ {
            type : 'slider',//显示拖拽功能
        } ],
        toolbox : {
            show : true,
            feature : {
                mark : {
                    show : true
                },
                dataView : {
                    show : true,
                    readOnly : false
                },
                magicType : {
                    show : true,
                    type : [ 'line', 'scatter','bar' ]
                },
                restore : {
                    show : true
                },
                saveAsImage : {
                    show : true
                }
            }
        },
        xAxis : {
            type : 'category',
            data : [],
        },
        yAxis : {
            type : 'value'
        },
        series : [
            {
                name:"总分",
                data : [],
                type : 'line',
                color : [ '#FF0000' ]
            } ,
            {
                name:"难度",
                data : [],
                type : 'line',

                color : [ '#0af0f1' ]
            },
            {
                name:"正确率(%)",
                data : [],
                type : 'bar',
                color : [ '#00aa00' ],
                label: {
                    normal: {
                        show: true,
                        formatter: function(v) {
                            var val = v.data;
                            return '\n'+ val +'%';
                        },
                        color: '#fff'
                    }
                },
            }
        ]
    };

    /* courseExamInfo = {
        title : {
            text : '试卷总体分析',
        },
        tooltip : {
            trigger : 'axis'
        },
        legend : {
            data : [ '最高气温', '最低气温' ]
        },
        toolbox : {
            show : true,
            feature : {
                mark : {
                    show : true
                },
                dataView : {
                    show : true,
                    readOnly : false
                },
                magicType : {
                    show : true,
                    type : [ 'line', 'bar' ]
                },
                restore : {
                    show : true
                },
                saveAsImage : {
                    show : true
                }
            }
        },
        calculable : true,
        xAxis : [ {
            type : 'category',
            boundaryGap : false,
            data : [ '周一', '周二', '周三', '周四', '周五', '周六', '周日' ]
        } ],
        yAxis : [ {
            type : 'value',
            axisLabel : {
                formatter : '{value} °C'
            }
        } ],
        series : [ {
            name : '最高气温',
            type : 'line',
            data : [ 11, 11, 15, 13, 12, 13, 10 ],
            markPoint : {
                data : [ {
                    type : 'max',
                    name : '最大值'
                }, {
                    type : 'min',
                    name : '最小值'
                } ]
            },
            markLine : {
                data : [ {
                    type : 'average',
                    name : '平均值'
                } ]
            }
        }, {
            name : '最低气温',
            type : 'line',
            data : [ 1, -2, 2, 5, 3, 2, 0 ],
            markPoint : {
                data : [ {
                    name : '周最低',
                    value : -2,
                    xAxis : 1,
                    yAxis : -1.5
                } ]
            },
            markLine : {
                data : [ {
                    type : 'average',
                    name : '平均值'
                } ]
            }
        } ]
    }; */

    $.ajax({
        url : "<%=request.getContextPath()%>/ajax/total_getDatas.do",
        async : false,
        success : function(data) {
            var text=  mini.decode(data);
            console.log("a:"+JSON.stringify(text))

            //X
            var info = text.data;
            console.log("info:"+JSON.stringify(info))
            for (var i = 0; i < info.length; i++) {
                courseAvgInfo.xAxis.data[i] = info[i].month;
                courseAvgInfo.series[0].data[i] = info[i].monthTotal;
                // courseAvgInfo.series[1].data[i] = info[i].max;
                // courseAvgInfo.series[2].data[i] = info[i].min;
                // courseAvgInfo.series[3].data[i] = info[i].count;
                // courseStdInfo.xAxis.data[i] = info[i].examPaperName;
                // courseStdInfo.series[0].data[i] = info[i].std;
                // courseStdInfo.series[1].data[i] = info[i].stddev_samp;
                // courseStdInfo.series[2].data[i] = info[i].avg;
                // courseExamInfo.xAxis.data[i]=info[i].examPaperName;
                // courseExamInfo.series[0].data[i]=info[i].examPaperScore;
                // courseExamInfo.series[1].data[i]=info[i].difficulty;
                // courseExamInfo.series[2].data[i]=info[i].rate;
            }
        }
    });

    $.ajax({
        url : "<%=request.getContextPath()%>/ajax/monthDept_getDatas.do",
        async : false,
        success : function(data) {
            var text=  mini.decode(data);
            console.log("a:"+JSON.stringify(text))
            //X
            var info = text.data;
            console.log("info-部门:"+JSON.stringify(info))
            for (var i = 0; i < info.length; i++) {
                courseStdInfo.xAxis.data[i] = info[i].dept;
                courseStdInfo.series[0].data[i] = info[i].monthTotal;
                // courseStdInfo.series[1].data[i] = info[i].stddev_samp;
                // courseStdInfo.series[2].data[i] = info[i].avg;
                // courseExamInfo.xAxis.data[i]=info[i].examPaperName;
                // courseExamInfo.series[0].data[i]=info[i].examPaperScore;
                // courseExamInfo.series[1].data[i]=info[i].difficulty;
                // courseExamInfo.series[2].data[i]=info[i].rate;
            }
        }
    });


    /* 饼图 */
    var tab2Option = {
        title : {
            text : '某站点用户访问来源',
            subtext : '纯属虚构',
            x : 'center'
        },
        tooltip : {
            trigger : 'item',
            formatter : "{a} <br/>{b} : {c} ({d}%)"
        },
        legend : {
            orient : 'vertical',
            left : 'left',
            data : [ '直接访问', '邮件营销', '联盟广告', '视频广告', '搜索引擎' ]
        },
        series : [ {
            name : '访问来源',
            type : 'pie',
            radius : '55%',
            center : [ '50%', '60%' ],
            data : [ {
                value : 335,
                name : '直接访问'
            }, {
                value : 310,
                name : '邮件营销'
            }, {
                value : 234,
                name : '联盟广告'
            }, {
                value : 135,
                name : '视频广告'
            }, {
                value : 1548,
                name : '搜索引擎'
            } ],
            itemStyle : {
                emphasis : {
                    shadowBlur : 10,
                    shadowOffsetX : 0,
                    shadowColor : 'rgba(0, 0, 0, 0.5)'
                }
            }
        } ]
    };

    /* 柱图  */
    var tab3Option = {
        xAxis : {
            type : 'category',
            data : [ 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun' ]
        },
        yAxis : {
            type : 'value'
        },
        series : [ {
            data : [ 120, 200, 150, 80, 70, 110, 130 ],
            type : 'bar'
        } ]
    };

    /* 初始化tab1的 */
    var tab1Table = echarts.init($tab1);
    tab1Table.setOption(courseAvgInfo);

    var tab2Table = echarts.init($tab2);
    tab2Table.setOption(courseStdInfo);

    // tab1Table.setOption(tab2Option);

    /* shown.bs.tab为tab选项卡高亮 */
    $('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
        /* 获取已激活的标签页的名称 */
        /* hash 属性是一个可读可写的字符串，该字符串是 URL 从 # 号开始的部分 */
        var activeTab = $(e.target)[0].hash;
        /* 当相应的标签被点击时，进行对应的图表渲染 */
        if (activeTab == "#tab2") {
            /* 释放图表实例，使实例不可用,不加上这个，会报错： */
            /* there is a chart instance     already initialized on the dom */
            echarts.dispose($tab2);
            var tab2Table = echarts.init($tab2);

            /* tab2Table.setOption(tab2Option); */
            tab2Table.setOption(courseStdInfo);

        } else if (activeTab == "#tab3") {
            echarts.dispose($tab3);
            var tab3Table = echarts.init($tab3);

            /* tab3Table.setOption(tab3Option); */
            tab3Table.setOption(courseExamInfo);
        }
    });
</script>
</div>
</body>
</html>