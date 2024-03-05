<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } ARTICLE SEARCH"></c:set>
<%@ include file="../common/head.jspf"%>


<style>

.outer-box {
  width: auto;
  display: flex;
  justify-content: center;
}

.small-outer-box {
  width: 1000px;
}

.head-box {
  margin-top: 30px;
  width: 1000px;
  height: 100px;
  text-align: center;
  display: flex;
  align-items: center;
}

.title {
  width: 1000px;
  height: 41px;
  text-align: center;
  color: black;
  font-size: 40px;
  font-family: "Inria Serif", serif;
  font-weight: 400px;
  word-wrap: break-word;
}

.outer-search-box {
  width: 1000px;
  height: 100px;
  display: flex;
  justify-content: center;
}
.search-box {
  width: 900px;
  height: 100px;
}

.search-box .grow {
  width: 90%; 
  text-align: center;
}

.theme {
  width: 1000px;
  font-size: 25px;
  font-weight: bold;
  text-align: center;
}

.line {
  width: 1000px;
  height: 0px;
  position: absolute;
  border: 1px black solid;
}

.content-box {
  width: 1000px;
  height: 300px;
}


.menu-box {
  width: 1000px;
}

.img-box {
  width: 1000px;
  border: 1px solid black;
  justify-content: space-between;
  border-radius: 7px;
  display: flex;
  margin-top: 15px;
  padding: 10px;
 
}




.con-box, .self-box, .trend-box, .community-box {
  margin-top: 20px;
}







</style>


 <div class="outer-box">
  <div class="small-outer-box">
    <div class="head-box">
      <div class="title">통합검색</div>
    </div>
    <div class="outer-search-box">
      <div class="search-box">
        <label class="input input-bordered flex items-center gap-2">
          <input type="text" class="grow" placeholder="Search" />
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="w-4 h-4 opacity-70">
            <path fill-rule="evenodd" d="M9.965 11.026a5 5 0 1 1 1.06-1.06l2.755 2.754a.75.75 0 1 1-1.06 1.06l-2.755-2.754ZM10.5 7a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0Z" clip-rule="evenodd" />
          </svg>
        </label>
      </div>
    </div>

    <div class="con-box">
      <div class="menu-box">
        <div class="theme">Consulting</div>
        <div class="line"></div>
      </div>
      <div class="img-box">
        <div class="img">
        <img class="banner" style="width: 290px; height: 263px" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" />
      </div>
        <div class="img">
        <img class="banner" style="width: 290px; height: 263px;" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" />
</div>
        <div class="img">
        <img class="banner" style="width: 290px; height: 263px" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" /></div>
      </div>

    </div>

    <div class="self-box">
      <div class="menu-box">
        <div class="theme">SELF</div>
        <div class="line"></div>
      </div>
      <div class="img-box">
        <div class="img">
        <img class="banner" style="width: 290px; height: 263px" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" />
      </div>
        <div class="img">
        <img class="banner" style="width: 290px; height: 263px;" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" />
</div>
        <div class="img">
        <img class="banner" style="width: 290px; height: 263px" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" /></div>
      </div>


    </div>
    
    
    
    <div class="trend-box">
      <div class="menu-box">
        <div class="theme">LATEST IN TRENDS</div>
        <div class="line"></div>
      </div>
      <div class="img-box">
        <div class="img">
        <img class="banner" style="width: 290px; height: 263px" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" />
      </div>
        <div class="img">
        <img class="banner" style="width: 290px; height: 263px;" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" />
</div>
        <div class="img">
        <img class="banner" style="width: 290px; height: 263px" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" /></div>
      </div>


    </div>
    
    <div class="community-box">
     <div class="menu-box">
        <div class="theme">COMMUNITY</div>
        <div class="line"></div>
      </div>
      <div class="img-box">
        <div class="img">
        <img class="banner" style="width: 290px; height: 263px" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" />
      </div>
        <div class="img">
        <img class="banner" style="width: 290px; height: 263px;" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" />
</div>
        <div class="img">
        <img class="banner" style="width: 290px; height: 263px" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" /></div>
      </div>


</div>

<%@ include file="../common/foot.jspf"%>