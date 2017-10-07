package com.gestaofesta.festa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gestaofesta.festa.model.Convidado;
import com.gestaofesta.festa.model.Convidados;

@Controller
public class ConvidadosController {
	
	@Autowired
	private Convidados convidados;
	
	@GetMapping("/convidados")
	public ModelAndView listar() {
		ModelAndView modelAndView = new ModelAndView("ListaConvidados");
		//modelAndView.addObject("convidados", convidados.findAll());
		//System.out.println("Tamanho dos convidados  ---- "+ convidados.findAll().size());
		return modelAndView;
	}
	@GetMapping("/convidadas")
	public String listarC() {
		
		return "ListaConvidados";
	}
	@GetMapping("/convidadosLista")
	public @ResponseBody List<Convidado> listarConvidados() {
		
		return convidados.findAll();
	}
	
	@RequestMapping(value = "/convidados",method = RequestMethod.POST,consumes ={ MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody List<Convidado> salvar(@RequestBody Convidado convidado) {
		System.out.println("Convidados Post sendo chamado." + convidado.getNome()+ convidado.getQuantidadeAcompanhantes());
		this.convidados.save(convidado);
		return convidados.findAll();
	}
	
	
}
