var clock = document.getElementById("clock");
    //获取时钟id
    var hour_line = document.getElementById("hour_line"),
        minute_line = document.getElementById("minute_line");
    //3、设置动态时间
    function setTime(){
        var nowdate = new Date();
        //获取年月日时分秒
        var year = nowdate.getFullYear(),
            month = nowdate.getMonth()+1,
            day = nowdate.getDay(),
            hours = nowdate.getHours(),
            minutes = nowdate.getMinutes(),
            seconds = nowdate.getSeconds(),
            date = nowdate.getDate();
        //时分秒针设置
        var hour_rotate = (hours*30-90) + (Math.floor(minutes / 12) * 6);
        hour_line.style.transform = 'rotate(' + hour_rotate + 'deg)';
        minute_line.style.transform = 'rotate(' + (minutes*6 - 90) + 'deg)';
        updateTime();
    }

    function updateTime(){
        var now = new Date();
        var hour = now.getHours()+"";
        var minutes = now.getMinutes();
        var time = (hour.length == 1 ? "0" + hour : hour) + ":" + minutes;
        $(".hour_min").text(time);
        var am_pm = parseInt(hour,10) >= 12 ? "PM" : "AM";
        $(".am_pm").text(am_pm);
        $(".date").text(now.getFullYear() + "年" + (now.getMonth()+1) + "月" + now.getDate() + "日");
    }
    setTime();
    setInterval(setTime, 1000);


$(document).on("click",".all",function(){
    $(".dialog-mgmt").show(100);
});

$(document).on("click",".close",function(){
    $(".dialog-mgmt").hide(100);
});