<%@page contentType="text/html" pageEncoding="UTF-8" %>
<jsp:useBean id="artista" scope="request" type="com.example.Base_Conciertos.entity.Artista"/>
<!DOCTYPE html>
<html>
<head>
    <title>Editar un trabajo</title>
    <jsp:include page="../includes/headCss.jsp"></jsp:include>
</head>
<body>
<div class='container'>
    <div class="row mb-4">
        <div class="col"></div>
        <div class="col-md-6">
            <h1 class='mb-3'>Editar un Artista</h1>
            <form method="POST" action="<%=request.getContextPath()%>/ArtistasController?action=crear">
                <input type="hidden" class="form-control" name="id" value="<%=artista.getArtistaId()%>">

                <div class="mb-3">
                    <label class="form-label">Job Title</label>
                    <input type="text" class="form-control" name="jobTitle" value="<%=artista.getNombreGrupo()%>">
                </div>
                <div class="mb-3">
                    <label class="form-label">Min Salary</label>
                    <input type="text" class="form-control" name="minSalary" value="<%=artista.getFechaCreacion()%>">
                </div>
                <div class="mb-3">
                    <label class="form-label">Max Salary</label>
                    <input type="text" class="form-control" name="maxSalary" value="<%=artista.getTipoMusica()%>">
                </div>
                <a href="<%= request.getContextPath()%>/ArtistasController" class="btn btn-danger">Cancelar</a>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
        <div class="col"></div>
    </div>
</div>
</body>
</html>