package com.example.Base_Conciertos.Daos;

import com.example.Base_Conciertos.entity.Artista;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ArtistaDao extends DaoBase {

    public ArrayList<Artista> listarArtistas() {

        ArrayList<Artista> lista = new ArrayList<>();

        String sql = "SELECT idArtistas, Nombre_Grupo, Tipo_musica\n" +
                "FROM conciertosperu.artistas;";

        try (Connection conn = this.getConection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Artista artista = new Artista();
                artista.setArtistaId(rs.getString(1));
                artista.setNombreGrupo(rs.getString(2));
                artista.setTipoMusica(rs.getString(3));
                lista.add(artista);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ArtistaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public Artista obtenerArtista(String artistaId) {

        Artista artista = null;

        String sql = "SELECT idArtistas, Nombre_Grupo, Tipo_musica\n" +
                "FROM conciertosperu.artistas\n" +
                "WHERE idArtistas = ?;";
        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setString(1, artistaId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    artista = new Artista();
                    artista.setArtistaId(rs.getString(1));
                    artista.setNombreGrupo(rs.getString(2));
                    artista.setTipoMusica(rs.getString(3));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ArtistaDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return artista;
    }

    public void actualizarArtista(String artistaId, String nombreGrupo, String fechaCreacion, String tipoMusica) throws SQLException {

        String sql = "UPDATE conciertosperu.artistas\n" +
                "SET Nombre_Grupo = ?, Tipo_musica = ?, Fecha_creacion = ?\n" +
                "WHERE idArtistas = ?;";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setString(1, nombreGrupo);
            pstmt.setString(2, fechaCreacion);
            pstmt.setString(3, tipoMusica);
            pstmt.setString(4, artistaId);
            pstmt.executeUpdate();
        }
    }

    public void borrarArtista(String artistaId) throws SQLException {

        String sql = "DELETE FROM conciertosperu.artistas WHERE idArtistas = ?;";
        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setString(1, artistaId);
            pstmt.executeUpdate();
        }
    }
}
