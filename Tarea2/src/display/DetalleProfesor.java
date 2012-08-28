package display;
import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.springframework.web.context.*;

import domain.ProfesorModule;
import domain.GrupoModule;

public class DetalleProfesor extends PageController {

  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    ProfesorModule module = (ProfesorModule) context.getBean("profesorModule");
    try {
		int accion = request.getParameter("accion"));	
		if(accion.equals('insertar')){
			forward("/agregarProfesor.jsp",request,response);	
		}else if(accion.equals('actualizar')){
			String id = request.getParameter("id");
			int idProf = Integer.parseInt(id);
			Map prof = module.buscar(idProf);	
			GrupoModule group = (GrupoModule) context.getBean("grupoModule");
			List data = group.listadoPorProfesor(id);
			request.setAttribute("gruposProfesor",data);	
			request.setAttribute("profesor",prof);
			forward("/detalleProfesor.jsp",request,response);			
		}else{
		throw new Exception();
		}	
    } catch (Exception e) {
      request.setAttribute("mensaje",e.getMessage());
      forward("/paginaError.jsp",request,response);
    }
  }
}