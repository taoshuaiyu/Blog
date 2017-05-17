<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<meta charset="utf-8" />
		<title>文章列表</title>
		<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
		<link   rel="icon" href="https://open.sojson.com/favicon.ico" type="image/x-icon" />
		<link   rel="shortcut icon" href="https://open.sojson.com/favicon.ico" />
		<link href="${basePath}/js/common/bootstrap/3.3.5/css/bootstrap.min.css?${_v}" rel="stylesheet"/>
		<link href="${basePath}/css/common/base.css?${_v}" rel="stylesheet"/>
        <link href="${basePath}/css/common/bootstrap-datetimepicker.min.css" rel="stylesheet"/>
        <link href="${basePath}/css/common/bootstrap-select.css" rel="stylesheet"/>
		<script  src="http://open.sojson.com/common/jquery/jquery1.8.3.min.js"></script>
        <link href="${basePath}/css/common/markdowneditormd.css" rel="stylesheet"/>
		<script  src="${basePath}/js/common/layer/layer.js"></script>
		<script  src="${basePath}/js/common/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <script  src="${basePath}/js/common/bootstrap/bootstrap-select.js"></script>
		<script  src="${basePath}/js/shiro.demo.js"></script>
        <script  src="${basePath}/js/common/editormd/editormd.min.js"></script>
        <#--<script type="text/javascript" src="${basePath}/js/common/bootstrap/locales/bootstrap-datetimepicker.de.js" charset="UTF-8"></script>-->
        <script type="text/javascript" src="${basePath}/js/common/bootstrap/bootstrap-datetimepicker.js" charset="UTF-8"></script>
        <script type="text/javascript" src="${basePath}/js/common/bootstrap/locales/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
		<script >
			so.init(function(){

                //markdown 文本初始化
                testEditor = editormd("test-editormd", {
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
				<@shiro.hasPermission name="/article/deleteArticleById.shtml">
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
				</@shiro.hasPermission>
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
			<@shiro.hasPermission name="/member/deleteUserById.shtml">
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
			</@shiro.hasPermission>

            function _operateArticle(id){
                if(id==null){
                    $('#operateArticle').modal();
				}else{
					$.post('${basePath}/article/selectArticleById/'+id+'.shtml',{articleId:id},function (result) {
					    console.log(result)
                        so.id('title').val(result.title);
                        so.id('content').val(result.content);
                        so.id('createDate').val(result.createDate);
                        $('#operateArticle').modal();
                    });
				}

			}

		</script>
	</head>
	<body data-target="#one" data-spy="scroll">
		
		<@_top.top 2/>
		<div class="container" style="padding-bottom: 15px;min-height: 300px; margin-top: 40px;">
			<div class="row">
				<@_left.article 1/>
				<div class="col-md-10">
					<h2>文章列表</h2>
					<hr>
					<form method="post" action="" id="formId" class="form-inline">
						<div clss="well">
					      <div class="form-group">
					        <input type="text" class="form-control" style="width: 300px;" value="${findContent?default('')}" 
					        			name="findContent" id="findContent" placeholder="输入标题 ">
					      </div>
					     <span class=""> <#--pull-right -->
				         	<button type="submit" class="btn btn-primary">查询</button>
							 <a class="btn btn-success" onclick="_operateArticle(null)">Edit</a>
				         	<@shiro.hasPermission name="/member/deleteUserById.shtml">
				         		<button type="button" id="deleteAll" class="btn  btn-danger">Delete</button>
				         	</@shiro.hasPermission>
				         </span>    
				        </div>
					<hr>
					<table class="table table-bordered">
						<tr>
							<th><input type="checkbox" id="checkAll"/></th>
							<th>标题</th>
							<th>内容</th>
							<th>审核状态</th>
							<th>创建时间</th>
							<th>操作</th>
						</tr>
						<#if page?exists && page.list?size gt 0 >
							<#list page.list as it>
								<tr>
									<td><input value="${it.id}" check='box' type="checkbox" /></td>
									<td>${it.title?default('空')}</td>
									<td>${it.content?default('未设置')}</td>
									<td>${(it.status==1)?string('有效','禁止')}</td>
									<td>${it.createDate?string('yyyy-MM-dd HH:mm:ss')}</td>
									<td>
										<@shiro.hasPermission name="/member/deleteUserById.shtml">
                                            <a href="javascript:_operateArticle([${it.id}]);">编辑</a>
											<a href="javascript:_delete([${it.id}]);">删除</a>
										</@shiro.hasPermission>
									</td>
								</tr>
							</#list>
						<#else>
							<tr>
								<td class="text-center danger" colspan="6">没有找到用户</td>
							</tr>
						</#if>
					</table>
					<#if page?exists>
						<div class="pagination pull-right">
							${page.pageHtml}
						</div>
					</#if>
					</form>
				</div>
			</div><#--/row-->

		<#--添加弹框-->
            <div class="modal fade" id="operateArticle" tabindex="-1" role="dialog" aria-labelledby="operateArticleLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="operateArticleLabel">添加文章</h4>
                        </div>
                        <div class="modal-body">
                            <form id="boxRoleForm">
                                <input type="hidden" name="id" value="">
                                <div class="form-group">
                                    <label for="recipient-name" class="control-label">文章标题:</label>
                                    <input type="text" class="form-control" name="title" id="title" placeholder="请输入文章标题"/>
                                </div>
                                <div class="form-group">
                                    <label for="recipient-name" class="control-label">文章内容:</label>
                                    <input type="text" class="form-control" id="content" name="content"  placeholder="请编辑文章内容">
                                </div>
                                <div class="form-group">
                                    <label for="recipient-name" class="control-label">文章类型:</label>
									<br>
                                    <select id="lunchBegins" class="selectpicker" data-live-search="true" data-live-search-style="begins" title="Please select a lunch ...">
                                        <option>Java</option>
                                        <option>Android</option>
                                        <option>Python</option>
                                        <option>C#</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="recipient-name" class="control-label">发表日期:</label>
                                    <div class="input-group date form_datetime "  data-date="" data-date-format="yyyy/mm/dd - HH:ii:ss " data-link-field="dtp_input1" data-link-format="hh:ii:ss">
                                        <input class="form-control" size="32" type="text" id="createDate" name="createDate" value="" >
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                                    </div>
                                    <input type="hidden" id="dtp_input1" value="" /><br/>
                                </div>
                                <div id="layout" class="form-group">
                                    <label for="recipient-name" class="control-label">发表日期:</label>
                                    <div id="test-editormd"></div>
                                </div>

                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" onclick="operateArticle();" class="btn btn-primary">Save</button>
                        </div>
                    </div>
                </div>
            </div>
		<#--/添加弹框-->
		</div>
			
	</body>
</html>