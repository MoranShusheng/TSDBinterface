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
        var checkcount = 0
        var arr = new Array();//获取选中的ID
        $(function () {
            //选择全部/全不选
            $("#All").change(function () {
                if ($("#All").is(':checked') == true) {
                    $(".item").prop("checked", "checked");
                    $("#button").removeClass("disabled");
                    isShow = true
                } if ($("#All").is(':checked') == false) {
                    $(".item").prop("checked", false);
                    $("#button").addClass("disabled");
                    isShow = false
                }
            });
            $(".item").change(function () {
                var cpount = $("input[name='checkItem']:checked").length
                if (cpount == $("input[name='checkItem']").length) {
                    $("#All").prop("checked", "checked")
                } else {
                    $("#All").prop("checked", false)
                }
                if (cpount != 0) {
                    $("#button").removeClass("disabled");
                    isShow = true
                } else {
                    $("#button").addClass("disabled");
                    isShow = false
                }
            });
        })
        var isShow = false
        function showModal() {
            $('#myModal').modal({
                show:isShow
            })
        }
        function delectDatabase() {
            //循环获取选中的ID
            $("input[name='checkItem']:checked").each(function (i) {
                arr[i] = $(this).val();
            });            
            var data = arr.join(",");
            $.ajax({
                type: 'GET',
                url: 'DelectDatabase.ashx?data='+data,
               // dataType: 'json',
               // data: { "data": data },
                success: function (response) {
                    $('#tips').text("套餐未到期，不能删除！（请求ID：" + response + "）")
                    $("#myModal").modal('hide');  //关闭模态框                
                    $('.alert-warning').removeClass('hide').addClass('in')  //弹出警告框 
                },
                error: function (response) {
                    alert("error")
                }
            })
            //关闭警告框是重新加载数据库列表页面
            $('#myAlert').bind('closed.bs.alert', function () {
                window.location.href = 'Index.aspx'
            })
        }
    </script>
</head>
<body>     
    <div class="container-fluid page">
        <div class="col-md-12 main">
            <%-- <div class="alert alert-danger alert-dismissible hide" id="adderrmsg" role="alert">--%>
            <div class="alert alert-warning hide" id="myAlert" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                
                <strong>系统提示</strong><br/>
                 <span id="tips"></span>
            </div>
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
                            <td style="width:20px"><input type="checkbox" id="All" name="checkAll"/></td>
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
                    <tbody id="fruit">
                        <tr>
                            <td style="width:20px"><input type="checkbox" class="item" name="checkItem" value="<%=database.databaseId%>"/></td>
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
