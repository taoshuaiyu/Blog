/**
 * Created by YLBG-TSY-1502 on 2017/5/17.
 */
so.init(function(){

    //markdown 文本初始化
    testEditor = editormd("content", {
        width   : "90%",
        height  : 320,
        syncScrolling : "single",
        path    : "${basePath}/js/common/editormd/lib/",
        saveHTMLToTextarea : true
    });
//                testEditor.getMarkdown();       // 获取 Markdown 源码
//                testEditor.getHTML();           // 获取 Textarea 保存的 HTML 源码
//                testEditor.getPreviewedHTML();  // 获取预览窗口里的 HTML，在开启 watch 且没有开启 saveHTMLToTextarea 时使用

    //初始化全选。
    so.checkBoxInit('#checkAll','[check=box]');
        //全选
        so.id('deleteAll').on('click',function(){
            var checkeds = $('[check=box]:checked');
            if(!checkeds.length){
                return layer.msg('请选择要删除的选项。',so.default),!0;
            }
            var array = [];
            checkeds.each(function(){
                array.push(this.value);
            });
            return _delete(array);
        });
    $('.form_datetime').datetimepicker({
        language:  'zh',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        forceParse: 0,
        showSecond:1,
        minuteStep:1,

    });
});

    //根据ID数组，删除
    function _delete(ids){
        var index = layer.confirm("确定这"+ ids.length +"个用户？",function(){
            var load = layer.load();
            $.post('${basePath}/article/index.shtml',{ids:ids.join(',')},function(result){
                layer.close(load);
                if(result && result.status != 200){
                    return layer.msg(result.message,so.default),!0;
                }else{
                    layer.msg('删除成功');
                    setTimeout(function(){
                        $('#formId').submit();
                    },1000);
                }
            },'json');
            layer.close(index);
        });
    }

function _save(){
    $('#articleModalForm').submit(function (data) {
        console.alert(data)
    })
}

function _operateArticle(id){
    if(id==null){
        $('#operateArticle').modal();
    }else{
        $.post('${basePath}/article/selectArticleById/'+id+'.shtml',{articleId:id},function (result) {
            console.log(result)
            so.id('id').val(result.id)
            so.id('title').val(result.title);
            so.id('content').val(result.content);
            $('#operateArticle').modal();
        });
    }

}