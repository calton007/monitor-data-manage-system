<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="ThemeBucket">
  <link rel="shortcut icon" href="#" type="image/png">

  <title>监测信息获取系统</title>

  <link href="js/advanced-datatable/css/demo_page.css" rel="stylesheet" />
  <link href="js/advanced-datatable/css/demo_table.css" rel="stylesheet" />
  <link rel="stylesheet" href="js/data-tables/DT_bootstrap.css" />

  <link href="css/style.css" rel="stylesheet">
  <link href="css/style-responsive.css" rel="stylesheet">

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>

<body class="boxed-view">

<section>
    <div class="container">
        <!-- left side start-->
        <div class="left-side">

            <!--logo and iconic logo start-->
            <div class="logo">
            <a href="getByUserId.action"><img src="images/logo_icon.png" alt=""></a>
            
            <span><font color=white size=3><b>监测信息获取系统</b></font> </span>
           
        </div>
            <!--logo and iconic logo end-->


            <div class="left-side-inner">

               <!--sidebar nav start-->
                <ul class="nav nav-pills nav-stacked custom-nav">
                    <li><a href="getByUserId.action"><i class="fa fa-home"></i> <span>主页</span></a></li>
                    <li><a href="updateProj.action"><i class="fa fa-laptop"></i> <span>评价项目</span></a>
                    </li>
                    <li><a href=""><i class="fa fa-book"></i> <span>监测任务</span></a>
                    </li>                    
					<li><a href="profile.jsp"><i class="fa fa-user"></i> <span>账户信息</span></a>
					</li>
                    <li><a href="login.jsp"><i class="fa fa-sign-in"></i> <span>退出</span></a></li>

                </ul>
                <!--sidebar nav end-->

            </div>
        </div>
        <!-- left side end-->

        <!-- main content start-->
        <div class="main-content" >

            <!-- header section start-->
            <div class="header-section">

            <!--toggle button start-->
            <a class="toggle-btn"><i class="fa fa-bars"></i></a>
            <!--toggle button end-->

           

            <!--notification menu start -->
            <div class="menu-right">
                <ul class="notification-menu"> 
                    <li>
                        <a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                            <img src="images/photos/user1.png" alt="" />
                            <s:property value="#session.user.employType"/>
                            <s:property value="#session.user.employName"/>
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                            <li><a href="profile.jsp"><i class="fa fa-user"></i> 账户信息</a></li>
                            <li><a href="login.jsp"><i class="fa fa-sign-out"></i> 退出</a></li>
                        </ul>
                    </li>

                </ul>
            </div>
            <!--notification menu end -->

            </div>
            <!-- header section end-->

            <!-- page heading start-->
        <div class="page-heading">
            <h3>
                评价项目
                <s:a href="./pingjiaxiangmu.jsp">
             <button class="btn btn-primary">
                           					 	返回 
               </button>
              </s:a>
            </h3>
            
            
        </div>
        <!-- page heading end-->

        <div class="wrapper">

            <div class="row">
            	<div class="col-md-2">
            	</div>
                <div class="col-md-8">
                    <div class="row">
                        
                        <div class="col-md-12">
                            <div class="panel">
                                <div class="panel-body">
                                    <ul class="p-info">
                                        <li>
                                            <div class="title">项目编号</div>
                                            <s:property value="#session.monitorhead.projectId"/>
                                        </li>
                                        <li>
                                            <div class="title">项目名</div>
                                            <s:property value="#session.monitorhead.taskName"/>
                                        </li>
                                        <li>
                                            <div class="title">地区</div>
                                            <s:property value="#session.monitorhead.area"/>
                                        </li>                                          
                                        <li>
                                            <div class="title">状态</div>
                                            <s:property value="#session.monitorhead.status"/>
                                        </li>                                       
                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
					</div>
				</div>
			</div>
		</div>
		<!-- page heading start-->
        
        <!-- page heading end-->

        <!--body wrapper start-->
        <div class="wrapper">
        <div class="row">
        <div class="col-sm-12">
        <section class="panel">
        <header class="panel-heading">
            监测项目
           
        </header>
        <div class="panel-body">
        <div class="adv-table">
        <table  class="display table table-bordered table-striped" id="dynamic-table">
        <thead>
        <tr>
            <th>监测点名</th>
            <th>监测数据</th>
            <th>监测开始时间</th>
            <th>监测结束时间</th>
            <th>状态</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="#session.monitorlist" id="t">
        	<tr>
        		<td><s:property value="monitorName" /> </td>
        		<td><s:property value="monitorItem" /> </td>
        		
        		<td><s:date name="monitorBegin"  format="yyyy-MM-dd" nice="false"  /></td>
        		<td><s:date name="monitorEnd"  format="yyyy-MM-dd" nice="false"  /></td>
        		<td>
        		<s:if test="status=='处理中'">
        			等待结果
        		</s:if>
        		<s:else>
        			<s:a href="getData.action?monitorId=%{#t.monitorId}&monitorBegin=%{#t.monitorBegin}&monitorEnd=%{#t.monitorEnd}" >查询结果</s:a>
        		</s:else>
        		 </td> 
        	</tr>
        </s:iterator>
        </tbody>
        
        </table>
        </div>
        </div>
        </section>
        </div>
        </div>


        <!--body wrapper end-->

            <!--footer section start-->
            <footer >
                2016 &copy; 监测信息获取系统   by  李观波
            </footer>
            <!--footer section end-->


        </div>
        <!-- main content end-->
    </div>
</section>


</section>

<!-- Placed js at the end of the document so the pages load faster -->
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/modernizr.min.js"></script>
<script src="js/jquery.nicescroll.js"></script>

<!--dynamic table-->
<script type="text/javascript" language="javascript" src="js/advanced-datatable/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="js/data-tables/DT_bootstrap.js"></script>
<!--dynamic table initialization -->
<script src="js/dynamic_table_init.js"></script>

<!--common scripts for all pages-->
<script src="js/scripts.js"></script>


</body>
</html>

