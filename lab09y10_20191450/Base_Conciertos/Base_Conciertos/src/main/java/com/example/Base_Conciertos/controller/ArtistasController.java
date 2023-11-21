package com.example.Base_Conciertos.controller;

import com.example.Base_Conciertos.entity.Artista;
import com.example.Base_Conciertos.Daos.ArtistaDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ArtistaController", urlPatterns = {"/ArtistaController"})
public class ArtistasController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");

        ArtistaDao artistaDao = new ArtistaDao();
        RequestDispatcher view;
        Artista artista;
        String artistaId;

        switch (action) {
            case "formCrear":
                view = request.getRequestDispatcher("artistas/newArtista.jsp");
                view.forward(request, response);
                break;
            case "lista":
                ArrayList<Artista> listaArtistas = artistaDao.listarArtistas();

                request.setAttribute("lista", listaArtistas);

                view = request.getRequestDispatcher("artistas/listaArtistas.jsp");
                view.forward(request, response);
                break;

            case "editar":
                artistaId = request.getParameter("idArtistas");
                artista = artistaDao.obtenerArtista(artistaId);
                if (artista == null) {
                    response.sendRedirect(request.getContextPath() + "/ArtistaController");
                } else {
                    request.setAttribute("artista", artista);
                    view = request.getRequestDispatcher("artistas/updateArtistas.jsp");
                    view.forward(request, response);
                }
                break;
            case "borrar":
                artistaId = request.getParameter("idArtistas");
                if (artistaDao.obtenerArtista(artistaId) != null) {
                    try {
                        artistaDao.borrarArtista(artistaId);
                    } catch (SQLException e) {
                        response.sendRedirect(request.getContextPath() + "/ArtistaController?err=Error al borrar al artista");
                    }
                }
                response.sendRedirect(request.getContextPath() + "/ArtistaController?msg=El artista ha sido borrado exitosamente");
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


}
