//package newProject;
//Francisco Gustavo Braga Batista

public class Aluno {
	  private int id;
	  private String nome;
	  private double media;
	  protected double nota1;
	  protected double nota2;


	  public String getNome() {
	    return nome;
	  }


	  public void setNome(String newNome) {
	    this.nome = newNome;
	  }


	  public int getId() {
	    return id;
	  }


	  public void setId(int newId) {
	    this.id = newId;
	  }


	  private void calculaMedia() {
	    this.media = (nota1 + nota2) / 2;
	  }


	  public double retornaMedia() {
	    calculaMedia();
	    return this.media;
	  }


	  public boolean passou() {
	    if (media > 7.0) {
	      return true;
	    } else {
	      return false;
	    }
	  }
	}
