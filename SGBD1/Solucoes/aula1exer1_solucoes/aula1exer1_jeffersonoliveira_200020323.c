#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    char placa[8];
    char modelo[20];
} Carro;

typedef struct {
    char nome[21];
    char cpf[12];
    int num_carros;
    Carro carros[10]; 
} Cadastro;

int main() {
    int contador = 0;
    Cadastro *proprietarios = NULL;
    int cadastro_carros = 0;

    while (1) {
        char nome[21];
        char cpf[12];
        char placa[8];
        char modelo[20];
        printf("Nome do Proprietário (ou 'sair' para finalizar): ");
        scanf("%s", nome);

        if (strcmp(nome, "sair") == 0) {
            break;
        }

        printf("CPF do Proprietário: ");
        scanf("%s", cpf);

        printf("Quantidade de carros do proprietário:");
        scanf("%d", &cadastro_carros);

        proprietarios = (Cadastro *)realloc(proprietarios, (contador + 1) * sizeof(Cadastro));
        proprietarios[contador].num_carros = cadastro_carros;

        for (int j = 0; j < cadastro_carros; j++) {
            printf("Placa do Carro %d:", j + 1);
            scanf("%s", placa); 

            printf("Modelo do Carro %d:", j + 1);
            scanf("%s", modelo); 

            strcpy(proprietarios[contador].carros[j].placa, placa);
            strcpy(proprietarios[contador].carros[j].modelo, modelo);

        }

        contador++;

        if (proprietarios == NULL) {
            fprintf(stderr, "Erro na alocação de memória\n");
            return 1;
        }

        strcpy(proprietarios[contador - 1].nome, nome);
        strcpy(proprietarios[contador - 1].cpf, cpf);
    }

    FILE *arquivo = fopen("dados.bin", "wb");
    if (arquivo == NULL) {
        perror("Erro ao abrir o arquivo");
        return 1;
    }

    fwrite(proprietarios, sizeof(Cadastro), contador, arquivo); 
    fclose(arquivo);

    printf("Dados salvos em 'dados.bin'\n");

    FILE *arquivo_lido = fopen("dados.bin", "rb");
    if (arquivo_lido == NULL) {
        perror("Erro ao abrir o arquivo");
        return 1;
    }

    Cadastro dados_lidos[contador]; 
    fread(dados_lidos, sizeof(Cadastro), contador, arquivo_lido); 
    fclose(arquivo_lido);

    printf("Proprietários cadastrados:\n\n");

    for (int i = 0; i < contador; i++) {
        printf("Proprietário %d:\n", i + 1);
        printf("Nome: %s\n", dados_lidos[i].nome); 
        printf("CPF: %s\n\n", dados_lidos[i].cpf); 

        printf("Veículos do usuário:\n");
        for (int j = 0; j < dados_lidos[i].num_carros; j++) {
            printf("Carro %d:\n", j + 1);
            printf("Placa: %s\n", dados_lidos[i].carros[j].placa);
            printf("Modelo: %s\n\n", dados_lidos[i].carros[j].modelo);
        }
        printf("\n");
    }

    free(proprietarios);

    return 0;
}
