public class Aluno {
  private int id;
  private String nome;
  private double media;
  protected double nota1;
  protected double nota2;


  public void  imprimeNome(){
    System.out.println("Nome do aluno: " + nome);
  }
  
  public String getNome() {
    return nome;
  }

  public void setNome(String newNome) {
    this.nome = newNome;
  }

  public void imprimeId(){
    System.out.println("Id do aluno: " + id);
  }

  public int getId() {
    return id;
  }


  public void setId(int newId) {
    this.id = newId;
  }


  private void calculaMedia() {
    media = (nota1 + nota2) / 2;
  }


  public double retornaMedia() {
    calculaMedia();
    return media;
  }


  public boolean passou() {
    if (media > 7.0) {
      return true;
    } else {
      return false;
    }
  }
}
