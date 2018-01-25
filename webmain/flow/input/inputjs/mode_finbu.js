//流程模块【finbu.发票补录】下录入页面自定义js页面,初始函数
function initbodys(){
    $(form('project')).change(function(){
        var sel = document.getElementsByName('num');
        if(sel == '') return;
        var index = sel[0].selectedIndex;
        form('projectName').value = sel[0][index].innerHTML;
    });
}