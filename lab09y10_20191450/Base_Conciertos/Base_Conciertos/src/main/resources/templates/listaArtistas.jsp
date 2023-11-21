<%@page import="java.util.ArrayList" %>
<%@ page import="com.example.Base_Conciertos.entity.Artista" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<jsp:useBean type="java.util.ArrayList<com.example.Base_Conciertos.entity.Artista>" scope="request" id="lista"/>
<!DOCTYPE html>
<html>
<head>
    <title>Lista trabajos</title>
    <jsp:include page="../includes/headCss.jsp"></jsp:include>
</head>
<body>
<div class='container'>
    <div class="row mb-5 mt-4">
        <div class="col-md-7">
            <h1>Lista de Artistas del Concierto</h1>
        </div>
    </div>
    <% if (session.getAttribute("msg") != null) {%>
    <div class="alert alert-success" role="alert"><%=session.getAttribute("msg")%>
    </div>
    <%
            session.removeAttribute("msg");
        } %>
    <% if (request.getParameter("err") != null) {%>
    <div class="alert alert-danger" role="alert"><%=request.getParameter("err")%>
    </div>
    <% } %>
    <table class="table">
        <tr>
            <th>#</th>
            <th>ID Artista</th>
            <th>Nombre del Grupo</th>
            <th>Tipo de Musica</th>
            <th></th>
            <th></th>
        </tr>
        <%
            int i = 1;
            for (Artista artista : lista) {
        %>
        <tr>
            <td><%=i%>
            </td>
            <td><%=artista.getArtistaId()%>
            </td>
            <td><%=artista.getNombreGrupo()%>
            </td>
            <td><%=artista.getTipoMusica()%>
            </td>
            <td>
                <a href="<%=request.getContextPath()%>/ArtistasController?action=editar&id=<%=artista.getArtistaId()%>">
                    Editar
                </a>
            </td>
            <td>
                <a href="<%=request.getContextPath()%>/ArtistasController?action=borrar&id=<%=artista.getArtistaId()%>">
                    Borrar
                </a>
            </td>
        </tr>
        <%
                i++;
            }
        %>
    </table>
</div>
</body>
</html>