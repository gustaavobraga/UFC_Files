//package newProject;
//Francisco Gustavo Braga Batista

public class Disciplina {
	  Aluno[] listaAluno = new Aluno[10];
	  double somaNota1 = 0;
	  double somaNota2 = 0;

	  public void setAddAluno(Aluno aluno) {
	    for (int i = 0; i < 10; i++) {
	      if (listaAluno[i] == null) {
	        listaAluno[i] = aluno;
	        break;
	      }
	    }
	  }

	  public int getContarAluno() {
	    int numAluno = 0;

	    for (int i = 0; i < 10; i++) {
	      if (listaAluno[i] != null) {
	        numAluno++;
	      }
	    }

	    return numAluno;
	  }

	  public void mediaTurmaNota1() {
	    for (int i = 0; i < 10; i++) {
	      if (listaAluno[i] != null) {
	        somaNota1 = somaNota1 + listaAluno[i].nota1;
	      }
	    }
	    System.out.println("Média nota1= " + somaNota1 / getContarAluno());

	  }

	  public void mediaTurmaNota2() {
	    for (int i = 0; i < 10; i++) {
	      if (listaAluno[i] != null) {
	        somaNota2 = somaNota2 + listaAluno[i].nota2;
	      }
	    }
	    System.out.println("Média nota2= " + somaNota2 / getContarAluno());
	  }

	  public boolean[] verificarPosicao(int idArray) {
	    // A posição 0 do array, é referente se o valor passado é válida ou não
	    // A posição 1 do array, é referente ao aluno antecessor
	    // A posição 2 do array, é referente ao aluno sucessor
	    boolean[] resultado = new boolean[3];

	    if (idArray >= 0 && idArray <= 9) {
	      resultado[0] = true;

	      // Se a posição for igual a 0, imprimi só o aluno sucessor.
	      if (idArray == 0) {
	        resultado[1] = false;

	        if (listaAluno[idArray + 1] != null) {
	          resultado[2] = true;
	          return resultado;

	        } else {
	          System.out.println("Não há aluno cadastrado na posição.");
	          resultado[2] = false;
	          return resultado;
	        }
	      }

	      // Se a posição for igual a 9, imprimi só o aluno antecessor.
	      else if (idArray == 9) {
	        resultado[2] = false;

	        if (listaAluno[idArray - 1] != null) {
	          resultado[1] = true;
	          return resultado;
	        } else {
	          System.out.println("Não há aluno cadastrado na posição.");
	          resultado[1] = false;
	          return resultado;
	        }
	      }

	      else {
	        if (listaAluno[idArray - 1] != null) {
	          resultado[1] = true;

	        } else {
	          resultado[1] = false;
	        }

	        if (listaAluno[idArray + 1] != null) {
	          resultado[2] = true;

	        } else {
	          resultado[2] = false;
	        }

	        return resultado;
	      }

	    } else {

	      System.out.println("Posição inválida. Informe uma posição entre 0 e 9.");
	      resultado[0] = false;
	      return resultado;

	    }

	  }

	  public void posicaoAluno(int idArray) {

	    boolean[] id = verificarPosicao(idArray);

	    if (id[0] == true) {

	      if (id[1] == true) {
	        String AluAntecessor = listaAluno[idArray - 1].getNome();
	        System.out.println("O aluno " + AluAntecessor + " está localizado na posição " + (idArray - 1) + " do array.");
	      }

	      if (id[2] == true) {
	        String AluSucessor = listaAluno[idArray + 1].getNome();
	        System.out.println("O aluno " + AluSucessor + " está localizado na posição " + (idArray + 1) + " do array.");
	      }

	      if (id[1] == false && id[2] == false) {
	        System.out.println("Não há aluno cadastrado na posição.");
	      }
	    }

	  }
	}
