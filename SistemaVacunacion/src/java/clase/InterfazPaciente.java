/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clase;
import clase.PacienteBean;
import java.util.List;
/**
 *
 * @author User
 */
public interface InterfazPaciente {
    public boolean insertar(PacienteBean Paciente);
    public List<PacienteBean> buscar ();
    
}
