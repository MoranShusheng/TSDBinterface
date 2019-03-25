<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DatabaseInformation.aspx.cs" Inherits="listview.WebApp.DatabaseInformation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <div>
        <div class="detailHeader__header">
            <span>shifandata1</span><span class="detailHeader__databaseStatus detailHeader__Active">正常</span>
            <div class="detailHeader__button">
                <div class="link__link">
                    <button type="button" class="ant-btn ant-btn-primary"><span>查询面板</span></button>
                </div>
            </div>
        </div>
        <div class="detailForm__container">
            <form class="ant-form ant-form-horizontal">
                <div class="ant-row" style="margin-left: -0.5px; margin-right: -0.5px;">
                    <div class="ant-col-12" style="padding-left: 0.5px; padding-right: 0.5px;">
                        <div class="detailForm__title">基本信息</div>
                    </div>
                    <div class="ant-col-12" style="padding-left: 0.5px; padding-right: 0.5px;">
                        <div class="detailForm__title">支付信息</div>
                    </div>
                </div>
                <div class="ant-row" style="margin-left: -0.5px; margin-right: -0.5px;">
                    <div class="ant-col-12" style="padding-left: 0.5px; padding-right: 0.5px;">
                        <div class="ant-row ant-form-item" style="margin-bottom: 8px; text-align: left;">
                            <div class="ant-col-4 ant-form-item-label">
                                <label class="" title="数据库名称">数据库名称</label>
                            </div>
                            <div class="ant-col-17 ant-form-item-control-wrapper">
                                <div class="ant-form-item-control "><span>shifandata1</span></div>
                            </div>
                        </div>
                    </div>
                    <div class="ant-col-12" style="padding-left: 0.5px; padding-right: 0.5px;">
                        <div class="ant-row ant-form-item" style="margin-bottom: 8px; text-align: left;">
                            <div class="ant-col-3 ant-form-item-label">
                                <label class="" title="计费模式">计费模式</label></div>
                            <div class="ant-col-17 ant-form-item-control-wrapper">
                                <div class="ant-form-item-control "><span class="ant-form-text">标准模式</span></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ant-row" style="margin-left: -0.5px; margin-right: -0.5px;">
                    <div class="ant-col-12" style="padding-left: 0.5px; padding-right: 0.5px;">
                        <div class="ant-row ant-form-item" style="margin-bottom: 8px; text-align: left;">
                            <div class="ant-col-4 ant-form-item-label">
                                <label class="" title="数据库ID">数据库ID</label></div>
                            <div class="ant-col-17 ant-form-item-control-wrapper">
                                <div class="ant-form-item-control "><span>tsdb-y016ju0yde77</span></div>
                            </div>
                        </div>
                    </div>
                    <div class="ant-col-12" style="padding-left: 0.5px; padding-right: 0.5px;">
                        <div class="ant-row ant-form-item" style="margin-bottom: 8px; text-align: left;">
                            <div class="ant-col-3 ant-form-item-label">
                                <label class="" title="支付方式">支付方式</label></div>
                            <div class="ant-col-17 ant-form-item-control-wrapper">
                                <div class="ant-form-item-control "><span class="ant-form-text">预付费</span></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ant-row" style="margin-left: -0.5px; margin-right: -0.5px;">
                    <div class="ant-col-12" style="padding-left: 0.5px; padding-right: 0.5px;">
                        <div class="ant-row ant-form-item" style="margin-bottom: 8px; text-align: left;">
                            <div class="ant-col-2 ant-form-item-label">
                                <label class="" title="描述">描述</label></div>
                            <div class="ant-col-17 ant-form-item-control-wrapper">
                                <div class="ant-form-item-control ">
                                    <div class="editable-cell-text-wrapper">
                                        shifandata1<i class="anticon anticon-edit detailForm__edit"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ant-col-12" style="padding-left: 0.5px; padding-right: 0.5px;">
                        <div class="ant-row ant-form-item" style="margin-bottom: 8px; text-align: left;">
                            <div class="ant-col-3 ant-form-item-label">
                                <label class="" title="到期时间">到期时间</label></div>
                            <div class="ant-col-17 ant-form-item-control-wrapper">
                                <div class="ant-form-item-control "><span class="ant-form-text">2019-04-24 20:57:25</span></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ant-row" style="margin-left: -0.5px; margin-right: -0.5px;">
                    <div class="ant-col-12" style="padding-left: 0.5px; padding-right: 0.5px;">
                        <div class="ant-row ant-form-item" style="margin-bottom: 8px; text-align: left;">
                            <div class="ant-col-2 ant-form-item-label">
                                <label class="" title="域名">域名</label></div>
                            <div class="ant-col-20 ant-form-item-control-wrapper">
                                <div class="ant-form-item-control "><span>shifandata1.tsdb-y016ju0yde77.tsdb.iot.bj.baidubce.com</span><span>&nbsp;&nbsp;</span><span class="detailForm__link">复制</span></div>
                            </div>
                        </div>
                    </div>
                    <div class="ant-col-12" style="padding-left: 0.5px; padding-right: 0.5px;">
                        <div class="ant-row ant-form-item" style="margin-bottom: 8px; text-align: left;">
                            <div class="ant-col-3 ant-form-item-label">
                                <label class="" title="创建时间">创建时间</label></div>
                            <div class="ant-col-17 ant-form-item-control-wrapper">
                                <div class="ant-form-item-control "><span class="ant-form-text">2018-12-24 20:57:23</span></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ant-row" style="margin-left: -0.5px; margin-right: -0.5px;">
                    <div class="ant-col-12" style="padding-left: 0.5px; padding-right: 0.5px;">
                        <div class="detailForm__title">配置信息</div>
                    </div>
                    <div class="ant-col-11" style="padding-left: 0.5px; padding-right: 0.5px;">
                        <div class="link__link">
                            <button type="button" class="ant-btn ant-btn-primary"><span>续 费</span></button></div>
                    </div>
                </div>
                <div class="ant-row" style="margin-left: -0.5px; margin-right: -0.5px;">
                    <div class="ant-col-12" style="padding-left: 0.5px; padding-right: 0.5px;">
                        <div class="ant-row ant-form-item" style="margin-bottom: 8px; text-align: left;">
                            <div class="ant-col-3 ant-form-item-label">
                                <label class="" title="写入额度">写入额度</label></div>
                            <div class="ant-col-17 ant-form-item-control-wrapper">
                                <div class="ant-form-item-control "><span>1百万点/月（配额）</span></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ant-row" style="margin-left: -0.5px; margin-right: -0.5px;">
                    <div class="ant-col-13" style="padding-left: 0.5px; padding-right: 0.5px;">
                        <div class="ant-row ant-form-item" style="margin-bottom: 8px; text-align: left;">
                            <div class="ant-col-4 ant-form-item-label">
                                <label class="" title="最大时间序列">最大时间序列</label></div>
                            <div class="ant-col-17 ant-form-item-control-wrapper">
                                <div class="ant-form-item-control "><span>1,000 个 </span><span><a href="https://cloud.baidu.com/doc/TSDB/ProductDescription.html#.E5.90.8D.E8.AF.8D.E8.A7.A3.E9.87.8A" target="_blank" rel="noopener noreferrer" style="color: rgb(16, 140, 238);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;什么是时间序列？</a></span></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ant-row" style="margin-left: -0.5px; margin-right: -0.5px;">
                    <div class="ant-col-12" style="padding-left: 0.5px; padding-right: 0.5px;">
                        <div class="ant-row ant-form-item" style="margin-bottom: 8px; text-align: left;">
                            <div class="ant-col-3 ant-form-item-label">
                                <label class="" title="存储空间">存储空间</label></div>
                            <div class="ant-col-17 ant-form-item-control-wrapper">
                                <div class="ant-form-item-control "><span>0GB</span><span style="margin: 0px 10px; color: rgb(167, 167, 167);">仅String、Byte等长数据格式占用该空间</span></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ant-row" style="margin-left: -0.5px; margin-right: -0.5px;">
                    <div class="ant-col-12" style="padding-left: 0.5px; padding-right: 0.5px;">
                        <button type="button" class="ant-btn ant-btn-primary"><span>升级配置</span></button><div style="margin: 0px 0px 0px 10px; display: none;"><i class="anticon anticon-question-circle-o"></i></div>
                    </div>
                </div>
            </form>
        </div>
    </div>


    <!--
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
        -->
</body>
</html>
