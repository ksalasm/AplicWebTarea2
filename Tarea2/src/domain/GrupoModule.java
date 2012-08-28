package domain;

import data.TableGateway;
import data.GrupoGateway;

import java.util.Map;
import java.util.List;
import java.io.IOException;
import javax.servlet.ServletException;

public class GrupoModule {

  private GrupoGateway gateway;

  public void setGateway(TableGateway gateway) {
    this.gateway = (GrupoGateway)gateway;
  }

  public void actualizar(int id, String numero,String sigla,String nombre,String horario,String aula, String id_profesor) throws Exception {
    if (id <= 0)
		throw new Exception("Identificador de grupo incorrecto");
	else
		gateway.update(id,numero,sigla,nombre,horario,aula,id_profesor);
  }
  
  public void insertar(String numero,String sigla,String nombre,String horario,String aula, String id_profesor) throws Exception {
    if (numero.equals(""))
		throw new Exception("Número de grupo incorrecto");
	else
		gateway.insert(numero,sigla,nombre,horario,aula,id_profesor);
  }

  public void eliminar(int id) throws Exception {
    if (id <= 0)
		throw new Exception("Identificador de grupo incorrecto");
    gateway.delete(id);
  }

  public Map<String,Object> buscar(int id) throws Exception {
    if (id <= 0)
		throw new Exception("Identificador de grupo incorrecto");    
	Map<String,Object> grupo = gateway.find(id+"");
    return grupo;
  }

  public List<Map<String,Object>> listado() throws Exception {
    List<Map<String,Object>> groups = gateway.findAll();
    return groups;
  }
  
  public List<Map<String,Object>> listadoPorProfesor(String idProfesor) throws Exception {
    List<Map<String,Object>> groups = gateway.findWithProfesorId(idProfesor);
    return groups;
  }
}