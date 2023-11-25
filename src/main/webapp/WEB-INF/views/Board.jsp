<%@ page language="java" contentType="text/html"%>

<%@include file="Header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
table {
   border-collapse: collapse;
   border-spacing: 0;
}

.page-title {
   margin-bottom: 60px;
}

.page-title h3 {
   font-size: 28px;
   color: #333333;
   font-weight: 400;
   text-align: center;
}

#board-search .search-window {
   padding: 15px 0;
   background-color: #f9f7f9;
}

#board-search .search-window .search-wrap {
   position: relative;
   /*   padding-right: 124px; */
   margin: 0 auto;
   width: 80%;
   max-width: 564px;
}

#board-search .search-window .search-wrap input {
   height: 40px;z
   width: 100%;
   font-size: 14px;
   padding: 7px 14px;
   border: 1px solid #ccc;
}

#board-search .search-window .search-wrap input:focus {
   border-color: #333;
   outline: 0;
   border-width: 1px;
}
#board-search .search-window .search-wrap input {
   width: 100%;
   /* 기존의 다른 스타일 속성들 */
}


#board-search .search-window .search-wrap .btn {
   position: absolute;
   right: 0;
   top: 0;
   bottom: 0;
   width: 108px;
   padding: 0;
   font-size: 16px;
}

.board-table {
   font-size: 13px;
   width: 100%;
   border-top: 1px solid #ccc;
   border-bottom: 1px solid #ccc;
}

.board-table a {
   color: #333;
   display: inline-block;
   line-height: 1.4;
   word-break: break-all;
   vertical-align: middle;
}

.board-table a:hover {
   text-decoration: underline;
}

.board-table th {
   text-align: center;
}

.board-table .th-num {
   width: 100px;
   text-align: center;
}

.board-table .th-date {
   width: 200px;
}

.board-table th, .board-table td {
   padding: 14px 0;
}

.board-table tbody td {
   border-top: 1px solid #e7e7e7;
   text-align: center;
}

.board-table tbody th {
   padding-left: 28px;
   padding-right: 14px;
   border-top: 1px solid #e7e7e7;
   text-align: left;
}

.board-table tbody th p {
   display: none;
}

.btn {
    display: inline-block;

    /* 폰트 스타일 관련 속성 */
    /* 
       주석 처리된 두 줄은 폰트 크기와 패딩을 지정하는 부분입니다.
       주석 처리되었으므로 현재 사용되지 않습니다.
    */
    /* padding: 0 30px; */
    /* font-size: 15px; */
    font-weight: 400; /* 폰트 굵기는 400입니다. */

    /* 배경 스타일 관련 속성 */
    background: transparent; /* 배경은 투명하게 설정합니다. */

    /* 텍스트 스타일 관련 속성 */
    text-align: center; /* 텍스트를 가운데 정렬합니다. */
    white-space: nowrap; /* 줄 바꿈 없이 텍스트를 표시합니다. */
    text-transform: uppercase; /* 텍스트를 대문자로 변환합니다. */

    /* 기타 스타일 관련 속성 */
    vertical-align: middle; /* 수직 정렬은 중앙으로 설정합니다. */
    -ms-touch-action: manipulation; /* Microsoft Edge용 터치 동작 설정 */
    touch-action: manipulation; /* 터치 동작 설정 */
    cursor: pointer; /* 커서 스타일을 포인터로 설정합니다. */
    -webkit-user-select: none; /* 웹킷 브라우저에서 사용자 선택 비활성화 */
    -moz-user-select: none; /* 모질라 브라우저에서 사용자 선택 비활성화 */
    -ms-user-select: none; /* Microsoft Edge에서 사용자 선택 비활성화 */
    user-select: none; /* 사용자 선택 비활성화 */
    border: 1px solid transparent; /* 테두리는 투명하게 설정합니다. */
    
    /* 테두리 모서리(radius)를 0으로 설정하여 각도 없는 모서리로 만듭니다. */
    -webkit-border-radius: 0;
    -moz-border-radius: 0;
    border-radius: 0;

    /* 모든 스타일 속성에 대한 전환 효과를 0.3초로 설정하여 부드러운 변화를 만듭니다. */
    -webkit-transition: all 0.3s;
    -moz-transition: all 0.3s;
    -ms-transition: all 0.3s;
    -o-transition: all 0.3s;
    transition: all 0.3s;
}


.btn-dark:hover, .btn-dark:focus {
   background: #373737;
   border-color: #373737;
   color: #fff;
}

.btn-dark {
   background: #555;
   color: #fff;
}



/* reset */
* {
   list-style: none;
   text-decoration: none;
   padding: 0;
   margin: 0;
   box-sizing: border-box;
}

.clearfix:after {
   content: '';
   display: block;
   clear: both;
}

/*.container {
   width: 1100px;
   margin: 0 auto;
}*/

.blind {
   position: absolute;
   overflow: hidden;
   clip: rect(0, 0, 0, 0);
   margin: -1px;
   width: 1px;
   height: 1px;
}
</style>

<body>
   <section class="Board">
      <div class="page-title">
         <div class="container">
            <h3>REVIEW</h3>
         </div>
      </div>

      <!-- board search area -->
      <div id="board-search">
         <div class="container">
            <div class="search-window">
               <form action="">
                  <div class="search-wrap">
                     <label for="search" class="blind">search</label> <input
                        id="search" type="search" name="" placeholder="" value="">
                     <button type="submit" class="btn btn-dark">search</button>
                  </div>
               </form>
            </div>
         </div>
      </div>


      <!-- board list area -->
      <div id="board-list">
         <div class="container">
            <table class="board-table">
               <thead>
                  <tr>
                     <th scope="col" class="th-num">No</th>
                     <th scope="col" class="th-title">Title</th>
                     <th scope="col" class="th-user">User</th>
                     
                  </tr>
               </thead>
               <tbody>
                  <c:forEach var="board" items="${boardList}" varStatus="status">
                     <tr>
                        <td>${status.count}</td>
                        <td><a href="<c:url value='/boardView?boardId=${board.boardId}' />">${board.title}</a></td>
                        <td>${board.customerName}</td>
                        <td></td>
                     </tr>
                  </c:forEach>
                  <tr>
                     <td colspan="4" style="text-align: right;">
  <a href="<c:url value="/boardWrite" />" class="btn btn-danger">Post</a>
</td>
                  </tr>
               </tbody>
            </table>
         </div>
      </div>
   </section>
</body>