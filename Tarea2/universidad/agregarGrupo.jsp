<%@ page import="java.util.*" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Sistema Universitario</title>
  </head>
  <h1>Sistema Universitario</h1>
  <% List profs = (List)request.getAttribute("profs"); %>
  <h2>Agregar Grupo</h2>
  <form name="AgregarGrupo" action="/universidad/agregarGrupo" method="get">
  <table>
    <tr><td>Numero:</td><td><input type="text" name="numero" value=""/></td></tr>
	<tr><td>Sigla:</td><td><input type="text" name="sigla"	value=""/></td></tr>
	<tr><td>Nombre:</td><td><input type="text" name="nombre" value=""/></td></tr>	
	<tr><td>Horario:</td><td><input type="text" name="horario" value=""/></td></tr>	
	<tr><td>Aula:</td><td><input type="text" name="aula" value=""/></td></tr>	
	<tr><td>Profesor:</td>
	<td>
	<select name="id_profesor">
		<% for(int i = 0, n = profs.size(); i < n; i++) {
			Map prof = (Map) profs.get(i); %>	
			<option value="<%= prof.get("id") %>"> <%= prof.get("nombre") %> </option>	
		<% } %>
	</select>
	</td></tr>
    <tr><td></td><td><input type="submit" value="Agregar" /></td></tr>
  </table>
  </form>
</html>