mini.parse();

var grid = mini.get("datagrid1");
grid.load();


function add() {
    var win = mini.get("win1");
    win.showAtPos('center', 'middle');
}

 function hideWindow() {
    var win = mini.get("win1");
    win.hide();
}