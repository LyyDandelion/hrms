// 四舍五入两位小数,并拼成##,###.##
function parseFormatNum(x) {
    x = parseFloat((x + "").replace(/[^\d\.-]/g, "")).toFixed(2) + "";
    var sub_val = x.split(".")[0].split("").reverse();
    var sub_xs = x.split(".")[1];
    var show_html = "";
    for (var i = 0; i < sub_val.length; i++) {
        show_html = show_html + sub_val[i] + ((i + 1) % 3 == 0 && (i + 1) != sub_val.length ? "," : "");
    }
    return show_html.split("").reverse().join("") + "." + sub_xs;
}

// 手机号输入校验
function onPhoneValidation(e) {
	var phoneValid1 = /^(0\d{2,3}(-)?)([2-9][0-9]{6,7})$/;
    var phoneValid = /^1[2345789]\d{9}$/;
    var phone400 = /^400(-)?[0-9]{3}(-)?[0-9]{4}$/;
    var phone800 = /^800(-)?[0-9]{3}(-)?[0-9]{4}$/;
    if (e.isValid) {
        var value = e.value.trim();
        if (value.substring(0,1) == 0) {
            if(!phoneValid1.test(value)){
            	e.errorText = "请输入正确的手机号码或电话号码";
                e.isValid = false;
            }
        } else {
            if (value.length > 8) {
                if (!phoneValid.test(value) && !phone400.test(value) && !phone800.test(value)) {
                    e.errorText = "请输入正确的手机号码或电话号码";
                    e.isValid = false;
                }
            } else {
                if (value.length != 8) {
                    e.errorText = "请输入正确的手机号码或电话号码";
                    e.isValid = false;
                }
            }
        }
    }
}

// 处理ajax异常
$(document).ajaxComplete(function(evt, request, settings) {
    var text = request.responseText;
    var obj = mini.decode(text);
    if ( obj != undefined && obj.error != undefined && obj.error != 0 ) {
        window.parent.removeTab(obj.message);
    }
});

// 禁止拖拉按钮
document.ondragstart = function(){return false};

//鼠标聚焦到表单的第一个错误输入框
function getValidateFocus(form) {
    var validateFields =  form.getValidateFields();
    $(validateFields).each(function() {
        if (this.errorText != "") {
            this.getTextEl().focus();
            return false;
        }
    });
}

//光标移除所作处理
function inputMouseMove(id){
    var value = mini.get(id).getValue();
    var name = mini.get(id).getText();
    if (name != "" && value == name) {
        mini.get(id).setValue("");
        mini.get(id).setText("");
        mini.alert("请输入正确的选项！");
        return;
    }
    if (name != "" && value == "") {
        mini.get(id).setValue("");
        mini.get(id).setText("");
        mini.alert("请输入正确的选项！");

    }
}

function beforenodeselect(e) {
    //禁止选中父节点
    if (e.isLeaf == false) e.cancel = true;
}

// 刷新首页待办
function refreshMainTabDaiBan() {
    var items = $("#ul_all li", parent.document);
    for (var i = items.length - 1; i >= 0; i--) {
        $($("#ul_all li", parent.document)[i]).click();
    }
}

//判断当前字符串是否以指定字符串结束
if(typeof String.prototype.endsWith != 'function'){
    String.prototype.endsWith = function(str){
        return this.slice(-str.length) == str;
    }
}