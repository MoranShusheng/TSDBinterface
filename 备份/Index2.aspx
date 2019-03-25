<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="listview.WebApp.Index" %>

<%@ Import Namespace="listview.Model" %>
<!--导入命名空间-->
<%@ Import Namespace="listview.BLL" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <title>数据库列表</title>
    <style>
        .page {
            height: 100vh;
            background-color: #E2E5EC;
        }

        .main {
            height: 95vh;
            background-color: #ffffff;
            margin-top: 15px;
            margin-bottom: 10px;
        }

        .title {
            cursor: pointer;
            text-align: center;
            font-size: 20px;
            height: 30px;
            line-height: 50px;
            vertical-align: middle; /*设置垂直居中*/
        }

        .button {
            margin-left: 30px;
        }

        .table-info {
            margin-top: 15px;
            margin-left: 30px;
        }
    </style>
    <script>
        var isShow = false
        var checkcount
        function check() {
            var checkbox = document.getElementById("checkAll");
            console.log(checkcount+"执行了我");
            //if (checkbox.checked == true) {
            //    $("#button").removeClass("disabled");
            //    isShow = true
            //    console.log("全选")
            //    console.log(checkcount)
            //}
            if (checkcount>=1) {
                $("#button").removeClass("disabled");
                isShow = true
                console.log("部分选")
                console.log(checkcount)
            }
            else {
                $("#button").addClass("disabled");
                isShow = false
            }
        }
        $(function(){
            function initTableCheckbox() {
                var $thr = $('table thead tr');
                var $checkAllTh = $('<th><input type="checkbox" id="checkAll" name="checkAll"/></th>');
                /*将全选/反选复选框添加到表头最前，即增加一列*/
                $thr.prepend($checkAllTh);
                /*“全选/反选”复选框*/
                var $checkAll = $thr.find('input');
                $checkAll.click(function(event){
                    /*将所有行的选中状态设成全选框的选中状态*/
                    $tbr.find('input').prop('checked', $(this).prop('checked'));
                    checkcount = $tbr.find('input:checked').length;
                    console.log("quanxuan" + checkcount);
                    check();/*执行删除按钮是否可用的方法*/
                    /*并调整所有选中行的CSS样式*/
                    if ($(this).prop('checked')) {
                        $tbr.find('input').parent().parent().addClass('warning');
                    } else{
                        $tbr.find('input').parent().parent().removeClass('warning');
                    }
                    /*阻止向上冒泡，以防再次触发点击操作*/
                    event.stopPropagation();
                });
                /*点击全选框所在单元格时也触发全选框的点击操作*/
                $checkAllTh.click(function(){
                    $(this).find('input').click();
                });
                var $tbr = $('table tbody tr');
                var $checkItemTd = $('<td><input type="checkbox" id="checkItem" name="checkItem"/></td>');
                /*每一行都在最前面插入一个选中复选框的单元格*/
                $tbr.prepend($checkItemTd);
                /*点击每一行的选中复选框时*/
                $tbr.find('input').click(function(event){
                    /*调整选中行的CSS样式*/
                    $(this).parent().parent().toggleClass('warning');
                    /*如果已经被选中行的行数等于表格的数据行数，将全选框设为选中状态，否则设为未选中状态*/
                    checkcount = $tbr.find('input:checked').length;
                    check(); /*执行删除按钮是否可用的方法*/
                    $checkAll.prop('checked', $tbr.find('input:checked').length == $tbr.length ? true : false);
                    /*阻止向上冒泡，以防再次触发点击操作*/
                    event.stopPropagation();
                });
                /*点击每一行时也触发该行的选中操作*/
                $tbr.click(function(){
                    $(this).find('input').click();
                });
            }           
            initTableCheckbox();
           
        });


        function showModal() {
            $('#myModal').modal({
                show:isShow
            })
        }
        function delectDatabase() {
            $.post({
                url: 'DelectDatabase.ashx',
                data: data,
                function (response) {
                    console.log(response);
                }
            })
        }
    </script>
</head>
<body>
    <div class="container-fluid page">
        <div class="col-md-12 main">
            <div class="title">数据库列表</div>
            <hr>
            <div class="button">
                <button class="btn btn-primary">创建数据库</button>
                <button id="button" class="btn btn-default disabled" onclick="showModal()" >删除</button> <!--data-toggle="modal" data-target="#myModal"-->
            </div> 
            <div class="table-info">
                <table class="table">
                    <thead>
                        <tr>
                            <!--<td style="width:20px"><input type="checkbox" id="checkAll" name="checkAll" onclick="check()"/></td>-->
                            <td>数据库名称</td>
                            <td>ID</td>
                            <td>描述</td>
                            <td>状态</td>
                            <td>到期时间</td>
                            <td>操作</td>
                        </tr>
                    </thead>
                    <% foreach (DatabasesInformation database in DatabaseList)
                        { %>
                    <tbody>
                        <tr>
                            <!--<td style="width:20px"><input type="checkbox" name="checkItem"  onclick="check()"/></td>-->
                            <td><a href="Memuindex.html?Id=<%=database.databaseId%>"><%=database.databaseName %></a></td>
                            <td><%=database.databaseId %></td>
                            <td><%=database.description %></td>
                            <td><%=database.status=="Active"?"正常":database.status%></td>
                            <td><%=database.expiredTime %></td>
                            <td><a href="DatabaseInformation.aspx">查询面版</a></td>
                        </tr>
                    </tbody>
                    <%} %>
                </table>
                <div style="right:100px;position:fixed">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li>
                                <a href="Index.aspx?<%=PageIndex-1<1?1:PageIndex-1 %>" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <li class="active"><a href="#"><%=PageIndex%></a></li>
                            <li>
                                <a href="Index.aspx?<%=PageIndex+1 >PageCount?PageCount:PageIndex+1 %>" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">删除数据库</h4>
                </div>
                <div class="modal-body">
                    是否确认删除？
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary"  onclick="delectDatabase()">确定</button>
                </div>
            </div>
        </div>
    </div>
    </div>
</body>
</html>
