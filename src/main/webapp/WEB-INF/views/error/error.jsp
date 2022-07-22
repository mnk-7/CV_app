<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="../dynamic/css.jspf"%>


<body>

<!-- ======= Error ======= -->
<header id="header">
    <div class="container">
        <div class="section-title">
            <p>Something went wrong...</p>
        <div>
        <a class="btn btn-secondary" href='<c:url value="/profiles"/>'> BACK </a></div>
    </div>
</header><!-- End Error -->

<%@include file="../dynamic/js.jspf"%>

</body>
</html>