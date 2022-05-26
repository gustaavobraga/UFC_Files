//package newProject;
//Francisco Gustavo Braga Batista

class Main {
  public static void main(String[] args) {
  
    Aluno aluno1 = new Aluno();
    aluno1.setNome("Gustavo");
    aluno1.setId(01);
    aluno1.nota1 = 3.5;
    aluno1.nota2 = 6.5;

    System.out.println("Id aluno 1: " + aluno1.getId());
    System.out.println("Media :" + aluno1.retornaMedia());
    System.out.println(aluno1.passou());
    System.out.print("\n");

    Aluno aluno2 = new Aluno();
    aluno2.setNome("João");
    aluno2.setId(2);
    aluno2.nota1 = 2.1;
    aluno2.nota2=2.0;  

    Aluno aluno3 = new Aluno();
    aluno3.setNome("Maria");
    aluno3.setId(3);
    aluno3.nota1 = 4;
    aluno3.nota2=6;  

    
    Disciplina disc = new Disciplina();
    disc.setAddAluno(aluno1);
    disc.setAddAluno(aluno2);
    disc.setAddAluno(aluno3);
    disc.mediaTurmaNota1();
    disc.mediaTurmaNota2();
    disc.posicaoAluno(3);
  }
}
