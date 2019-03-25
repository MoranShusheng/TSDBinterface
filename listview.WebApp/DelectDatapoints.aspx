﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DelectDatapoints.aspx.cs" Inherits="listview.WebApp.DelectDatapoints" %>
<%@ Import Namespace="listview.Model" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/bootstrap-select.min.css"/>
    <!--<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">-->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-select.min.js"></script>
    <script src="js/vue.js"></script>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <style>
        .main {
            background-color: #E2E5EC;
        }

        .select {
            margin-top: 15px;
        }

        .content {
            margin-top: 20px;
            padding-top: 15px;
            padding-left: 20px;
            padding-right: 20px;
            background-color: #ffffff;
        }

        .tables {
            margin-top: 50px;
            margin-bottom: 20px;
        }

        .tips {
            background-color: #DCDCDC;
            width: 300px;
        }

        .tag {
            border: 1px dashed #888888;
            background-color: #f7f7f7;
        }

        #title {
            margin-left: -20px;
            margin-right: -20px;
            margin-top: 5px;
        }

        .page {
            height: 100vh;
            background-color: #E2E5EC;
        }

        .radio {
            margin-left: 110px;
            /*float:left;*/
        }

        .filter {
            margin-left: 110px;
        }
    </style>
    <script>
        //全局变量
        var format = "";
        //构造符合datetime-local格式的当前日期
        function getFormat() {
            format = "";
            var nTime = new Date();
            format += nTime.getFullYear() + "-";
            format += (nTime.getMonth() + 1) < 10 ? "0" + (nTime.getMonth() + 1) : (nTime.getMonth() + 1);
            format += "-";
            format += nTime.getDate() < 10 ? "0" + (nTime.getDate()) : (nTime.getDate());
            format += "T";
            format += nTime.getHours() < 10 ? "0" + (nTime.getHours()) : (nTime.getHours());
            format += ":";
            format += nTime.getMinutes() < 10 ? "0" + (nTime.getMinutes()) : (nTime.getMinutes());
            format += ":00";
            return format;
        }
        $(function () {
            document.getElementById("starttime").value = getFormat()//赋初始值
            document.getElementById("endtime").value = getFormat()//赋初始值
            //for(var i=2000;i<2031;i++){
             //   $('#field').append("<option value=i>"+i+"</option>")
            //    var newOption = document.createElement("option");
            //    newOption.text=i+"年";
            //    newOption.value=i;
            //    document.getElementById("field").add(newOption);
            //}
        })
        //function delectMetric() {
        //    let metric = $('#metric option:selected').val();
        //    //var obj = document.getElementById('field');
        //    //obj.options.add(new Option("text", "value"));
        //    var fieldList = [];
        //    console.log(metric);
        //    $.ajax({
        //        type: 'GET',
        //        url: 'SelectedMetric.ashx?metric=' + metric,
        //        success: function (response) {
        //            console.log(response + "结果列表")
        //            fieldList = response.split(',');
        //            console.log(fieldList + fieldList.length)
        //            $('#field').append("<option value=i>最后一个</option>")
        //            var newOption = document.createElement("option");
        //            newOption.text = "最后两个";
        //            document.getElementById("field").add(newOption);
        //            for (let i = 0; i < fieldList.length; i++) {
        //                $('#field').append("<option value=i>" + i + "</option>")
        //                console.log(i)
        //            }
                    
        //            console.log("结束")
        //            alert("好的")
        //            //let content = ""
        //          //  console.log($('#field').text())
        //           // $('#field').append("<option value=i>第一</option>")
        //            //for (let i = 0; i < fieldList.length; i++) {
        //            //        var newOption = document.createElement("option");
        //            //        newOption.text = fieldList[i].text;
        //            //        newOption.value = i;
        //            //        document.getElementById("field").add(newOption);
        //            //    //content += "<option>" + fieldList[i] + "</option>"                       
        //            //    console.log(fieldList[i])
        //            //}
        //            // $("#field").html(content);
        //        },
        //        error: function (response) {
        //            alert("error")
        //        }
        //    })
        //    //for (var i = 2000; i < 2031; i++) {
        //    //    var newOption = document.createElement("option");
        //    //    newOption.text = i + "年";
        //    //    newOption.value = i;
        //    //    document.getElementById("field").add(newOption);
        //    //}
        //    console.log(fieldList.length + fieldList)
          
        //}
        //<!--取得选择的时间-->
        //        var radio=$('input[name="time"]:checked').val();
        //        if(radio=="0"){
        //            radio="全部"
        //        }else{
        //            radio="##"
        //        }
        //        $(".selectMetric").change(function(){
        //            var metric=$(".selectMetric").val()
        //            $.ajax({
        //                type: 'GET',
        //                url: 'DelectDatabase.ashx?data='+data,
        //                success: function (response) {
        //                    alert("success")
        //                },
        //                error: function (response) {
        //                    alert("error")
        //                }
        //            })
        //        });
    </script>

</head>
<body>

<div class="container-fluid page">
    <div class="col-md-12 main">
        <div class="content">
            <div class="row">
                <span class="col-md-2">数据库名称</span>
                <span class="col-md-2"><i class="fa fa-circle status">正常</i></span>
                <span class="col-md-2 col-md-offset-6"><button class="btn btn-default" data-toggle="modal"
                                                               data-target="#myModal">查询面板
                </button></span>
            </div>
            <hr id="title"/>
            <div class="tips">
                温馨提示：数据一旦删除无法恢复，请谨慎操作。
            </div>
            <br/><br/>
            <div>
                <div><label> 时间选择：</label></div>
                <div class="radio">
                    <input id="every" type="radio" name="time" value="0" checked="checked"/>全部<br/><br/>
                    <input type="radio" id="time" name="time" value="1"/>
                    开始时间：<input type="datetime-local" id="starttime"/>&emsp;&emsp;&emsp;
                    结束时间：<input type="datetime-local" id="endtime"/><br/><br/>
                </div>
            </div>
            <!--&lt;!&ndash; 日期选择插件 &ndash;&gt;-->
            <!--<div>-->
            <!--<div class="row">-->
            <!--<div class='col-sm-6'>-->
            <!--<div class="form-group">-->

            <!--<label>选择开始时间：</label>-->
            <!--&lt;!&ndash;指定 date标记&ndash;&gt;-->
            <!--<div class='input-group date' id='datetimepicker1'>-->
            <!--<input type='text' class="form-control"/>-->
            <!--<span class="input-group-addon">-->
            <!--<span class="glyphicon glyphicon-calendar"></span>-->
            <!--</span>-->
            <!--</div>-->
            <!--</div>-->
            <!--</div>-->
            <!--<div class='col-sm-6'>-->
            <!--<div class="form-group">-->
            <!--<label>选择结束时间：</label>-->
            <!--&lt;!&ndash;指定 date标记&ndash;&gt;-->
            <!--<div class='input-group date' id='datetimepicker2'>-->
            <!--<input type='text' class="form-control"/>-->
            <!--<span class="input-group-addon">-->
            <!--<span class="glyphicon glyphicon-calendar"></span>-->
            <!--</span>-->
            <!--</div>-->
            <!--</div>-->
            <!--</div>-->
            <!--</div>-->
            <!--</div>-->
            <!-- 日历选择 -->
            <div>
                <div class="select">
                    <label for="metric">度量：&emsp;&emsp;&emsp;</label>
                    <select class="selectpicker" name="度量" id="metric" @change="delectMetric()">
                        <option>全部</option>
                        <%for(int i = 0;i< ListMetrics.Count;i++){ %>
                           <option><%=ListMetrics[i]%></option>
                        <%} %>

                    </select>
                </div>
                <br/>
                <div class="select layui-form" lay-filter="test1">
                    <label for="field">域：&emsp;&emsp;&emsp;&emsp;</label>
                    <select class="selectpicker"  name="域：" id="field">
                        <option value="0">全部</option>
                        <option v-for="(item, index) in field" :key="index" :value="item">{{item}}</option>
                    </select>
                </div>
                <br/><br/>
                <div class="tags">
                    <label>标签过滤：&emsp;</label>
                    <div class="filter">
                        <!--<span id="filter"> </span>-->
                        <div v-for="(item, index) in lists" :key="index">
                            标签名：<input type='text' v-model:value="item.value1" name='tag'/>&emsp;&emsp;&emsp;&emsp;
                            标签值：<input type='text' v-model:value="item.value2" name='tag'/>
                            <button @click='deleteItem(index)'><i class='fa fa-trash'></i></button>
                            <br/><br/>
                        </div>
                        <button class="tag" @click="addFilter">+添加标签过滤</button>
                    </div>
                </div>
                <br/>
                <button class="btn btn-primary">清理数据</button>
                <div class="tables">
                    <table class="table">
                        <tr>
                            <th>启动时间</th>
                            <th>状态</th>
                            <th>结束时间</th>
                            <th>操作</th>
                        </tr>
                        <tr>
                            <td>2019-03-02</td>
                            <td>已完成</td>
                            <td>2019-03-02</td>
                            <td><a href="#">查看详情</a></td>
                        </tr>
                    </table>
                    <br/><br/><br/>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                </div>
                <div class="modal-body">
                    ...
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>

<script>
    var i = 0
    const vue = new Vue({
        el: '.page',
        data: {
            filters: {
                id: i,
                value1: '',
                value2: ''
            },
            lists: [],
            field: [],
        },
        methods: {
            deleteItem(value) {
                console.log(value)
                this.lists.splice(value, 1)
                console.log(this.lists)
            },
            addFilter() {
                console.log(this.filters)
                this.lists.push({
                    id: i,
                    value1: '',
                    value2: ''
                })
                console.log(this.lists)
            },
            delectMetric() {
                let metric = $('#metric option:selected').val();
                //var fieldList = [];
                console.log(metric);
                var that = this
                $.ajax({
                    type: 'GET',
                    url: 'SelectedMetric.ashx?metric=' + metric,
                    success: function (response) {
                        console.log(response + "结果列表")

                        that.field = response.split(',');
                        //console.log(fieldList + "  fieldList")
                       // that.field = fieldList
                        console.log(that.field + "  this")
                    },
                    error: function (response) {
                        alert("error")
                    }
                })
            }
        }
    })
</script>
