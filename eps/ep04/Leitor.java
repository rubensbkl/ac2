import java.io.*;

/**
 * EP04 - ULA 4 bits - Programa no PC (Java)
 * 
 * Este programa:
 * 1) Lê um programa fonte escrito em mnemônicos (arquivo testeula.ula)
 * 2) Converte cada instrução em código hexadecimal de 3 dígitos (X, Y, S)
 * 3) Gera o arquivo de saída "testeula.hex" que será enviado ao Arduino
 * 
 * Observações:
 * - O arquivo .ula contém linhas como "X=A;", "Y=3;", "W=AoB;".
 * - O programa ignora as palavras-chave "inicio" e "fim".
 * - Apenas quando encontra um "W=..." gera a linha completa em HEX.
 * - O mapeamento de mnemônicos → código segue a Tabela da ULA (0..F).
 */

public class Leitor {

    public static void main(String[] args) {
        // Arquivo de entrada (programa fonte) e saída (programa em HEX)
        String arquivo = "testeula.ula";
        String arquivoSaida = "testeula.hex";

        // Variáveis para armazenar os valores temporários
        char x = '\0';  // valor de X
        char y = '\0';  // valor de Y
        String op = ""; // código da operação (S)

        try (
            BufferedReader br = new BufferedReader(new FileReader(arquivo));
            PrintWriter pw = new PrintWriter(new FileWriter(arquivoSaida))
        ) {
            String linha;

            // Lê o arquivo fonte linha a linha
            while ((linha = br.readLine()) != null) {
                linha = linha.trim(); // remove espaços extras

                // Ignora palavras-chave "inicio" e "fim"
                if (linha.equalsIgnoreCase("inicio") || linha.equalsIgnoreCase("fim")) {
                    continue;
                }

                // Apenas linhas com "=" são relevantes (atribuições)
                if (linha.contains("=")) {
                    String[] parte = linha.split("=", 2);
                    String variavel = parte[0].trim(); // antes do "="
                    String valor = parte[1].trim();    // depois do "="

                    switch (variavel) {
                        // Atualiza X
                        case "X":
                            if (!valor.isEmpty()) {
                                x = valor.charAt(0); // pega o primeiro caractere (ex: "A;")
                            }
                            break;

                        // Atualiza Y
                        case "Y":
                            if (!valor.isEmpty()) {
                                y = valor.charAt(0);
                            }
                            break;

                        // Interpreta W (operação) e gera linha no .hex
                        case "W":
                            switch (valor) {
                                case "umL;":    op = "0"; break;
                                case "zeroL;":  op = "1"; break;
                                case "AonB;":   op = "2"; break;
                                case "nAonB;":  op = "3"; break;
                                case "AeBn;":   op = "4"; break;
                                case "nB;":     op = "5"; break;
                                case "nA;":     op = "6"; break;
                                case "nAxnB;":  op = "7"; break;
                                case "AxB;":    op = "8"; break;
                                case "copiaA;": op = "9"; break;
                                case "copiaB;": op = "A"; break;
                                case "AeB;":    op = "B"; break;
                                case "AenB;":   op = "C"; break;
                                case "nAeB;":   op = "D"; break;
                                case "AoB;":    op = "E"; break;
                                case "nAeBn;":  op = "F"; break;
                                default:
                                    op = "Erro"; // se não reconhecido
                            }

                            // Escreve no arquivo .hex no formato XYS (ex: "C6B")
                            pw.println("" + x + y + op);
                            break;
                    }
                }
            }
            System.out.println("Arquivo gerado com sucesso: " + arquivoSaida);

        } catch (IOException e) {
            System.err.println("Erro ao processar o arquivo: " + e.getMessage());
        }
    }
}
