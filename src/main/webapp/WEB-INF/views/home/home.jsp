<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="../dynamic/css.jspf"%>


<body>

<!-- ======= Basic Info Section ======= -->
<header id="header">
    <div class="container">

        <%@include file="../navigation/summary.jspf"%>

        <nav id="navbar" class="navbar">
            <ul>
                <%@include file="../navigation/navigation.jspf"%>
                <sec:authorize access="hasRole('ADMIN')">
                    <c:if test="${person.personId ne '1'}">
                        <li><a href='<c:url value="/home/${person.personId}/edit"/>'><span class="btn btn-success"> EDIT </span></a></li>
                    </c:if>
                </sec:authorize>
                <sec:authorize access="hasRole('DEVELOPER')">
                    <li><a href='<c:url value="/home/${person.personId}/edit"/>'><span class="btn btn-success"> EDIT </span></a></li>
                </sec:authorize>
            </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav>

        <div class="social-links">
            <%@include file="../contact/socialLinks.jspf"%>
        </div>

    </div>
</header><!-- End Basic Info Section -->

<%@include file="../dynamic/js.jspf"%>

</body>
</html>