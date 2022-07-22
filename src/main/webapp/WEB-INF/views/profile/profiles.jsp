<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="../dynamic/css.jspf"%>


<body>
<%@include file="../navigation/navigationMain.jspf"%>

<!-- ======= Profiles Section ======= -->
<section id="portfolio" class="portfolio section-show">
    <div class="container">

        <div class="section-title">
            <div class="row">
                <div class="col-sm-12 col-md-9 col-lg-9 col-xl-9">
                    <h2>Profiles</h2>
                </div>
            </div>
            <p>Select profile</p>
        </div>

        <div class="portfolio-container">
            <div class="row">

                <sec:authorize access="hasAnyRole('ADMIN', 'DEVELOPER')">
                    <div class="col-lg-4 col-md-6 portfolio-item">
                        <a href='<c:url value="/profiles/edit/person/add"/>'>
                            <div class="portfolio-wrap">
                                <img src="assets/img/create.jpg" class="img-fluid" alt="">
                                <div class="portfolio-info">
                                    <h3>&nbsp;</h3>
                                    <h4>Add new profile</h4>
                                </div>
                            </div>
                        </a>
                    </div>
                </sec:authorize>

                <c:forEach items="${map}" var="entry">
                    <div class="col-lg-4 col-md-6 portfolio-item">
                        <div class="portfolio-wrap">
                            <img src="data:image/*;base64,${entry.value}" class="img-fluid" alt="">
                            <div class="portfolio-info">
                                <a href='<c:url value="/home/${entry.key.personId}"/>'>
                                    <h3><strong>${entry.key.firstName}&nbsp;${entry.key.lastName}</strong></h3>
                                    <h4>${entry.key.shortDescription}</h4>
                                </a>
                                <sec:authorize access="hasRole('ADMIN')">
                                    <c:if test="${entry.key.personId ne '1'}">
                                        <br><a class="btn btn-dark" href='<c:url value="/profiles/edit/person/${entry.key.personId}/delete"/>'> DELETE </a>
                                    </c:if>
                                </sec:authorize>
                                <sec:authorize access="hasRole('DEVELOPER')">
                                    <br><a class="btn btn-dark" href='<c:url value="/profiles/edit/person/${entry.key.personId}/delete"/>'> DELETE </a>
                                </sec:authorize>
                            </div>
                        </div>
                     </div>
                </c:forEach>

            </div>
        </div>

    </div>
</section><!-- End Profiles Section -->

<%@include file="../dynamic/js.jspf"%>

</body>
</html>