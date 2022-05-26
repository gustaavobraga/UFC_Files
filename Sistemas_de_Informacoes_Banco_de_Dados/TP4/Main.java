class Main {
  public static void main(String[] args) {

    Aluno aluno1 = new Aluno();
    aluno1.setNome("João");
    aluno1.setId(1);
    aluno1.nota1 = 3.5;
    aluno1.nota2 = 6.5;

    System.out.println("Media : " + aluno1.retornaMedia());
    System.out.println(aluno1.passou());

    Aluno aluno2 = new Aluno();
    aluno2.setNome("João");
    aluno2.setId(2);
    aluno2.nota1 = 5;
    aluno2.nota2 = 10;

    Aluno aluno3 = new Aluno();
    aluno3.setNome("Ana");
    aluno3.setId(3);
    aluno3.nota1 = 6;
    aluno3.nota2 = 8.5;

    Disciplina turmaCK0084 = new Disciplina();
    turmaCK0084.adicionaAluno(aluno1, 0);
    turmaCK0084.adicionaAluno(aluno2, 1);
    turmaCK0084.adicionaAluno(aluno3, 2);
    double mediaNota1 = turmaCK0084.mediaTurmaNota1();

    System.out.println("Média nota1= " + mediaNota1);

    turmaCK0084.removerAluno(1);
    double mediaNota2 = turmaCK0084.mediaTurmaNota2();
    System.out.println("Média nota2= " + mediaNota2);

    turmaCK0084.adicionaAluno(aluno1, 0);

    turmaCK0084.imprimeAlunosProximos(0);
    turmaCK0084.imprimeAlunosProximos(1);
    turmaCK0084.imprimeAlunosProximos(2);
  }
}
