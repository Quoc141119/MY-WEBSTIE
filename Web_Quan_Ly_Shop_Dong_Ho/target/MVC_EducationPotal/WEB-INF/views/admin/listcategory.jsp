<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-hover" id="dataTable">
                        <thead>
                            <tr>
                                <th scope="col">CategoryID</th>
                                <th scope="col">CategoryName</th>                             
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                      
                            <c:forEach items="${listcategory }" var="item">
                                <tr>
                                
                                    <th scope="row">${item.getCategoryID() }</th>
                                    <td>${item.getCategoryName() }</td>
                                   
                                        
                                   	<td><a class="nav-link" href="">Delete</a></td>
                                   	<td><a class="nav-link" href="">Edit</a></td>
                                   
                                </tr>
                            </c:forEach>
                          
                        </tbody>
                    </table>
                    </div>
                </div>