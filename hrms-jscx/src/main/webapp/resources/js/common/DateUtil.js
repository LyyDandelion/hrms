/**
 * 返回指定格式的日期文本 比如yyyy/MM/dd hh:mm:ss
 * @param template 日期格式模板
 * @returns {String}
 */
Date.prototype.formatTo=function (template){
     var d = this;
     if(d == undefined || !(d instanceof Date)) return;
     var day = d.getDate();
     var year = d.getFullYear();
     var month= d.getMonth()+1;
     var hours= d.getHours();
     var minute=d.getMinutes()+1;
     var second=d.getSeconds()+1;
     var result = template.replace(/yyyy/i,year).replace("MM",month).replace(/dd/i,day).replace(/hh/i,hours).replace("mm",minute).replace(/ss/i,second);
     return  result;
    };


/**
 * 默认的日期文本格式化
 * @returns {String}
 */
Date.prototype.format=function (){
     var d = this;
    if(d == undefined || !(d instanceof Date)) return;
     var date = d.getDate();
     var year = d.getFullYear();
     var month= d.getMonth();
     return  (month+1)+"月"+date+"日";
    };

/**
 * 获取星期文本形式
 * @return "星期日","星期一 ","星期二","星期三","星期四","星期五","星期六"
 */
Date.prototype.getDayStr=function (){
     var weeks=["星期日","星期一 ","星期二","星期三","星期四","星期五","星期六"];
     var d =this;
    if(d == undefined || !(d instanceof Date)) return;
     return  weeks[d.getDay()];
};
/**
 * 计算相差n天的日期 比如-1 一天前 和 +32 32天后
 * 引用方式改变调用对象的值
 * @param n 天数
 * @returns {Date}
 */
Date.prototype.caculate=function(n){
    var d = this;
    if(d == undefined || !(d instanceof Date)) return;
    d = d.valueOf();
    d = d+n*24*60*60*1000;
    d = new Date(d);
    return d;
};

/**
 * 计算相差n天的日期 比如-1 一天前 和 +32 32天后
 * 返回计算后新的日期结果对象
 * @param n 天数
 * @returns Date
 */
function dateCaculate(date,n){
    if(d == undefined || !(d instanceof Date)) return;
    var newDate=date.valueOf();
    newDate=newDate+n*24*60*60*1000;
     return new Date(newDate);
}
