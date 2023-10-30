#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    char nome[50];
    char CPF[12];
    char telefone[12];
    int idade;
    char carros[10][20];
    char placas[10][8];
    int qtd_carros;
} Cadastro;

int compararCPF(const void *a, const void *b) {
    return strcmp(((Cadastro *)a)->CPF, ((Cadastro *)b)->CPF);
}

int main() {
    int sair = 1;
    Cadastro cad;
    FILE *arquivo;
    arquivo = fopen("cadastros.bin", "ab+"); 

    if (arquivo == NULL) {
        printf("ERRO AO ABRIR O ARQUIVO!\n");
        exit(-1);
    }

    while (1) {
        printf("Coloque seus dados nos itens a seguir:\n");
        
        printf("Nome: ");
        scanf(" %[^\n]s", cad.nome);

        printf("CPF (apenas números): ");
        scanf("%s", cad.CPF);

        FILE *leituraArquivo;
        leituraArquivo = fopen("cadastros.bin", "rb");
        if (leituraArquivo == NULL) {
            printf("ERRO AO ABRIR O ARQUIVO!\n");
            exit(-1);
        }

        int cpfEncontrado = 0;
        Cadastro cad_temp; 

        while (fread(&cad_temp, sizeof(Cadastro), 1, leituraArquivo) == 1) {
            if (strcmp(cad_temp.CPF, cad.CPF) == 0) {
                cpfEncontrado = 1;
                break; 
            }
        }

        fclose(leituraArquivo);

        if (cpfEncontrado) {
            printf("CPF já cadastrado. Tente novamente.\n");
            continue; 
        }

        printf("Número de telefone (apenas números): ");
        scanf("%s", cad.telefone);

        printf("Idade: ");
        scanf("%d", &cad.idade);

        printf("Quantos carros deseja cadastrar para %s: ", cad.nome);
        scanf("%d", &cad.qtd_carros);

        for (int i = 0; i < cad.qtd_carros; i++) {
            printf("Qual o nome do carro %d: ", i + 1);
            scanf("%s", cad.carros[i]);

            printf("Placa (7 dígitos) do carro %d: ", i + 1);
            scanf("%s", cad.placas[i]);
        }

        printf("SEUS DADOS ESTÃO NO ARQUIVO!\n");
        fwrite(&cad, sizeof(Cadastro), 1, arquivo);

        printf("Digite 1 para cadastrar outra pessoa ou outro número para sair: ");
        scanf("%d", &sair);

        if (sair != 1) {
            break;
        }
    }

    int sucesso = fclose(arquivo);

    if (sucesso != 0) {
        printf("ERRO AO FECHAR O ARQUIVO!\n");
        exit(-1);
    }

    system("clear");

    arquivo = fopen("cadastros.bin", "rb");

    if (arquivo == NULL) {
        printf("ERRO AO ABRIR O ARQUIVO!\n");
        exit(-1);
    }

    fseek(arquivo, 0, SEEK_END);
    long tamanho_arquivo = ftell(arquivo);
    int num_registros = tamanho_arquivo / sizeof(Cadastro);

    fseek(arquivo, 0, SEEK_SET);

    Cadastro *registros = (Cadastro *)malloc(sizeof(Cadastro) * num_registros);

    if (registros == NULL) {
        printf("ERRO AO ALOCAR MEMÓRIA!\n");
        exit(-1);
    }

    fread(registros, sizeof(Cadastro), num_registros, arquivo);

    qsort(registros, num_registros, sizeof(Cadastro), compararCPF);

    for (int i = 0; i < num_registros; i++) {
        printf("Nome: %s\nCPF: %s\nTelefone: %s\nIdade: %d\nQuantidade de Carros: %d\n",
               registros[i].nome, registros[i].CPF, registros[i].telefone, registros[i].idade, registros[i].qtd_carros);

        for (int j = 0; j < registros[i].qtd_carros; j++) {
            printf("Carro %d: %s\nPlaca %d: %s\n", j + 1, registros[i].carros[j], j + 1, registros[i].placas[j]);
        }

        printf("\n");
    }

    fclose(arquivo);

    free(registros);

    return 0;
}


















