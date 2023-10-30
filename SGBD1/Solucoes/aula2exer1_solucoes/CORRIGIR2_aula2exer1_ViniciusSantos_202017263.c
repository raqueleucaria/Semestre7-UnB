#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct pessoa {
    char placa_carro[100][8];
    char modelo_carro[100][20];
    int qtd_carros;
    char nome[100];
    int cpf;
} Pessoa;
Pessoa pessoas;

typedef struct carro {
    char modelo[20];
    char placa[8];
} Carro;
Carro carros;

int compareByCPF(const void *a, const void *b) {
    return ((Pessoa *)a)->cpf - ((Pessoa *)b)->cpf;
}

int compareByPlaca(const void *a, const void *b) {
    return strcmp(((Carro *)a)->placa, ((Carro *)b)->placa);
}

int main() {
    int opcao = 99, count1;

    FILE *ponteiro1;
    FILE *ponteiro2;

    do {
        printf("Escolha uma das opcoes, para sair digite 0:\n");
        printf("1 - Cadastrar Pessoas e veiculos vinculados\n");
        printf("2 - Atualizar a ordenacao dos cadastros\n");
        printf("3 - Mostrar cadastros\n");
        printf("opcao: ");
        scanf("%d", &opcao);

        switch (opcao) {
            case 1:
                printf("Quantas pessoas deseja cadastrar: ");
                scanf("%d", &count1);

                Pessoa *pessoasArray = malloc(count1 * sizeof(Pessoa));

                for (int i = 0; i < count1; i++) {
                    printf("Digite o nome da pessoa que deseja cadastrar: ");
                    scanf(" %[^\n]", pessoasArray[i].nome);

                    printf("Digite o CPF de %s: ", pessoasArray[i].nome);
                    scanf("%d", &pessoasArray[i].cpf);

                    printf("Quantos veiculos essa pessoa possui: ");
                    scanf("%d", &pessoasArray[i].qtd_carros);

                    for (int j = 0; j < pessoasArray[i].qtd_carros; j++) {
                        printf("Digite o modelo do carro %d: ", j + 1);
                        scanf(" %[^\n]", pessoasArray[i].modelo_carro[j]);

                        printf("Digite a placa do carro %d: ", j + 1);
                        scanf(" %[^\n]", carros.placa);
                        strcpy(pessoasArray[i].placa_carro[j], carros.placa);

                        printf("===================\n\n");
                    }

                    qsort(pessoasArray[i].placa_carro, pessoasArray[i].qtd_carros, sizeof(char[8]), compareByPlaca);
                }

                qsort(pessoasArray, count1, sizeof(Pessoa), compareByCPF);

                ponteiro1 = fopen("pessoas.bin", "ab");
                if (ponteiro1 == NULL) {
                    printf("Nao foi possivel criar ou abrir o arquivo.");
                    exit(0);
                }

                ponteiro2 = fopen("veiculos.bin", "ab");
                if (ponteiro2 == NULL) {
                    printf("Nao foi possivel criar ou abrir o arquivo.");
                    exit(0);
                }

                for (int i = 0; i < count1; i++) {
                    fwrite(&pessoasArray[i], sizeof(Pessoa), 1, ponteiro1);
                    for (int j = 0; j < pessoasArray[i].qtd_carros; j++) {
                        strcpy(carros.placa, pessoasArray[i].placa_carro[j]);
                        strcpy(carros.modelo, pessoasArray[i].modelo_carro[j]);
                        fwrite(&carros, sizeof(Carro), 1, ponteiro2);
                    }
                }

                fclose(ponteiro1);
                fclose(ponteiro2);
                free(pessoasArray);

                system("pause");
                system("cls");
                break;


            case 2:
                ponteiro1 = fopen("pessoas.bin", "rb+");
                if (ponteiro1 == NULL) {
                    printf("Nao foi possivel abrir o arquivo 'pessoas.bin'.\n");
                    exit(0);
                }

                ponteiro2 = fopen("veiculos.bin", "rb+");
                if (ponteiro2 == NULL) {
                    printf("Nao foi possivel abrir o arquivo 'veiculos.bin'.\n");
                    exit(0);
                }

                Pessoa pessoasarray[100];
                Carro carrosArray[100];

                int numPessoas = 0;
                int numCarros = 0;

                while (fread(&pessoasarray[numPessoas], sizeof(Pessoa), 1, ponteiro1)) {
                    numPessoas++;
                }

                while (fread(&carrosArray[numCarros], sizeof(Carro), 1, ponteiro2)) {
                    numCarros++;
                }

                qsort(pessoasarray, numPessoas, sizeof(Pessoa), compareByCPF);
                qsort(carrosArray, numCarros, sizeof(Carro), compareByPlaca);

                fclose(ponteiro1);
                fclose(ponteiro2);

                ponteiro1 = fopen("pessoas.bin", "wb");
                ponteiro2 = fopen("veiculos.bin", "wb");

                if (ponteiro1 == NULL || ponteiro2 == NULL) {
                    printf("Nao foi possivel abrir os arquivos em modo de escrita.\n");
                    exit(0);
                }

                for (int i = 0; i < numPessoas; i++) {
                    fwrite(&pessoasarray[i], sizeof(Pessoa), 1, ponteiro1);
                }

                for (int i = 0; i < numCarros; i++) {
                    fwrite(&carrosArray[i], sizeof(Carro), 1, ponteiro2);
                }

                fclose(ponteiro1);
                fclose(ponteiro2);

                printf("Dados ordenados e escritos de volta nos arquivos.\n");

                system("pause");
                system("cls");
                break;


            case 3:
                ponteiro1 = fopen("pessoas.bin", "rb");
                if (ponteiro1 == NULL) {
                    printf("Nao foi possivel criar ou abrir o arquivo.");
                    exit(0);
                }

                printf("\n\nPessoa e placa do carro em sua posse:\n\n");
                while (fread(&pessoas, sizeof(Pessoa), 1, ponteiro1)) {
                    printf("Nome: %s \n", pessoas.nome);
                    printf("CPF: %d \n", pessoas.cpf);
                    printf("Placa dos carros possuidos:\n");
                    for (int i = 0; i < pessoas.qtd_carros; i++) {
                        printf("* %s\n", pessoas.placa_carro[i]);
                    }
                    printf("====================\n");
                }

                ponteiro2 = fopen("veiculos.bin", "rb");
                if (ponteiro2 == NULL) {
                    printf("Nao foi possivel criar ou abrir o arquivo.");
                    exit(0);
                }

                printf("\n\nCarros cadastrados:\n\n");
                while (fread(&carros, sizeof(Carro), 1, ponteiro2)) {
                    printf("Modelo: %s\n", carros.modelo);
                    printf("Placa: %s\n", carros.placa);
                    printf("====================\n");
                }

                fclose(ponteiro1);
                fclose(ponteiro2);

                system("pause");
                system("cls");
                break;
        }
    } while (opcao != 0);
    return 0;
}
