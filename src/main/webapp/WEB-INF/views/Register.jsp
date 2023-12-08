<%@ page language="java" contentType="text/html"%>
<%@include file="Header.jsp" %>

<style>
    /* 외부 스타일 시트를 사용하여 스타일을 정의합니다. */
    .custom-form {
        max-width: 350px; /* 폼의 최대 너비를 줄임 */
        margin: 0 auto; /* 수평 가운데 정렬 */
        padding: 10px; /* 패딩을 줄임 */
    }

    .custom-form h3 {
        font-size: 20px; /* 폰트 크기를 줄임 */
        text-align: center; /* 가운데 정렬 */
    }

    .custom-form .form-group {
        margin-bottom: 10px; /* 마진을 줄임 */
    }

    .custom-form label {
        font-size: 14px; /* 폰트 크기를 줄임 */
    }

    .custom-form .form-control {
        font-size: 12px; /* 폰트 크기를 줄임 */
        padding: 8px; /* 패딩을 줄임 */
    }

    .custom-form .btn {
        font-size: 16px; /* 폰트 크기를 줄임 */
        padding: 10px; /* 패딩을 줄임 */
    }
</style>

<body>

<div class="container">
    <div class="row main">
        <div class="main-login custom-form">
            <h3>Sign up</h3>
            <form action="<c:url value="/register"/>" method="post">
                        
                <div class="form-group">
                    <label for="name" class="cols-sm-2 control-label">Your Name</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                           <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                           <input type="text" class="form-control" name="customerName" placeholder="Enter your Name"/>
                        </div>
                    </div>
                </div>

                <div class "form-group">
                  <label for="email" class="cols-sm-2 control-label">Your Email</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                            <input type="text" class="form-control" name="email" placeholder="Enter your Email"/>
                        </div>
                    </div>
                </div>
                    
                <div class="form-group">
                    <label for="name" class="cols-sm-2 control-label">Your Address</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                           <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                           <input type="text" class="form-control" name="customerAddr" placeholder="Enter your Address"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                  <label for="username" class="cols-sm-2 control-label">Username</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                           <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                           <input type="text" class="form-control" name="username"  placeholder="Enter your Username"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                        <label for="password" class="cols-sm-2 control-label">Password</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                <input type="password" class="form-control" name="password" placeholder="Enter your Password"/>
                            </div>
                        </div>
                </div>
                
                <div class="form-group">
                        <input type="submit" value="Register" class="btn btn-primary btn-lg btn-block login-button" />
                    </div>
                    
                </form>
            </div>
        </div>
    </div>
</body>