<%@ page import="java.util.*" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Sistema Universitario</title>
  </head>
  <h1>Sistema Universitario</h1>
  <h2>Eliminar Grupo</h2>
  <% Map grupo = (Map)request.getAttribute("grupo"); %>
  <% List profs = (List)request.getAttribute("profs"); %>
  <form name="BorrarGrupo" action="/universidad/borrarGrupo" method="get">
  <input type="hidden" name="id" value="<%= grupo.get("id") %>"/>
  <table>
<tr><td>Numero:</td><td><input type="text" name="numero" value="<%= grupo.get("numero") %>"/></td></tr>
<tr><td>Sigla:</td><td><input type="text" name="sigla" value="<%= grupo.get("sigla") %>"/></td></tr>
<tr><td>Nombre:</td><td><input type="text" name="nombre" value="<%= grupo.get("nombre") %>"/></td></tr>	
<tr><td>Horario:</td><td><input type="text" name="horario" value="<%= grupo.get("horario") %>"/></td></tr>	
<tr><td>Aula:</td><td><input type="text" name="aula" value="<%= grupo.get("aula") %>"/></td></tr>
<tr><td>Profesor:</td>
<td>	
<select name="id_profesor" disabled="true">
<% for(int i = 0, n = profs.size(); i < n; i++) {
Map prof = (Map) profs.get(i); %>	
<option value="<%= prof.get("id") %>" <% if(prof.get("id").toString().equals(grupo.get("id_profesor").toString())){ %> selected <% } %> > <%= prof.get("nombre") %> </option>	
<% } %>
</select>	
</td>
</tr>
    <tr><td></td><td><input type="submit" value="Eliminar" /></td></tr>
  </table>
  </form>
</html>