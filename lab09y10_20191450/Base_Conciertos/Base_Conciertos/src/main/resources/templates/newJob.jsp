<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Crear un nuevo trabajo</title>
        <jsp:include page="../includes/headCss.jsp"></jsp:include>
    </head>
    <body>
        <div class='container'>
            <div class="row mb-4">
                <div class="col"></div>
                <div class="col-md-6">
                    <h1 class='mb-3'>Crear un nuevo artista</h1>
                    <form method="POST" action="<%=request.getContextPath()%>/ArtistasController?action=crear">
                        <div class="mb-3">
                            <label class="form-label">Id Artista</label>
                            <input type="text" class="form-control" name="idArtista">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Nombre del grupo</label>
                            <input type="text" class="form-control" name="nombreGrupo">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Fecha de creacion</label>
                            <input type="text" class="form-control" name="fechaCreacion">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Tipo de musica</label>
                            <input type="text" class="form-control" name="tipoMusica">
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
