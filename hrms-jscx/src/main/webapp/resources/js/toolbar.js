// 页面工具栏
function showJTopoToobar(stage) {
    var toobarDiv = $('<div class="jtopo_toolbar" align="right">').html(''
        +'<input type="radio" name="modeRadio" value="normal" checked id="r1"/><label for="r1"> 默认</label>'
        +'&nbsp;<input type="radio" name="modeRadio" value="select" id="r2"/><label for="r2"> 框选</label>'
        +'&nbsp;<input type="radio" name="modeRadio" value="drag" id="r3"/><label for="r3"> 平移</label>'
        +'&nbsp;<input type="radio" name="modeRadio" value="edit" id="r4"/><label for="r4"> 编辑</label>'
        +'&nbsp;&nbsp;<a class="mini-button" style="width:90px" id="centerButton">居中显示</a>'
        +'&nbsp;&nbsp;<a class="mini-button" style="width:90px" id="zoomOutButton">放 大</a>'
        +'&nbsp;&nbsp;<a class="mini-button" style="width:90px" id="zoomInButton">缩 小</a>'
        +'&nbsp;&nbsp;<div id="zoomCheckbox" class="mini-checkbox" text="鼠标缩放" />'
        +'&nbsp;&nbsp;<a class="mini-button" style="width:90px" id="exportButton">导出PNG</a>');
        
    $('#fit').append(toobarDiv);
    mini.parse();

    // 工具栏按钮处理
    $("input[name='modeRadio']").click(function() {
        stage.mode = $("input[name='modeRadio']:checked").val();
    });
    $('#centerButton').click(function() {
        stage.centerAndZoom(); // 缩放并居中显示
    });
    $('#zoomOutButton').click(function() {
        stage.zoomOut();
    });
    $('#zoomInButton').click(function() {
        stage.zoomIn();
    });
    $('#exportButton').click(function() {
        stage.saveImageInfo();
    });
    $('#zoomCheckbox').click(function() {
        if (mini.get("zoomCheckbox").getChecked()) {
            stage.wheelZoom = null; // 取消鼠标缩放比例
        } else {
            stage.wheelZoom = 0.85; // 设置鼠标缩放比例
        }
    });
}