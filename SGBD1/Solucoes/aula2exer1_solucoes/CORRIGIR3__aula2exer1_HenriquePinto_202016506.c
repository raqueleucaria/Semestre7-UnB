#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    char marca[50];
    char modelo[50];
    char placa[50];
    int ano;
} Carro;

typedef struct {
    char cpf[15]; 
    char nome[50];
    Carro *carros;
    int num_carros;
    int capacidade_carros;
} Proprietario;


Proprietario *proprietarios = NULL;
int num_proprietarios = 0;
int capacidade_proprietarios = 0;

int compare_proprietarios(const void *a, const void *b) {
    Proprietario *p1 = (Proprietario *)a;
    Proprietario *p2 = (Proprietario *)b;
    return strcmp(p1->cpf, p2->cpf);
}

void salvar_arquivo_binario() {
    FILE *fp = fopen("cadastro.bin", "wb");
    if (fp == NULL) {
        printf("Erro ao abrir o arquivo.\n");
        return;
    }

    
    qsort(proprietarios, num_proprietarios, sizeof(Proprietario), compare_proprietarios);

    fwrite(&num_proprietarios, sizeof(int), 1, fp);

    for (int i = 0; i < num_proprietarios; i++) {
        Proprietario p = proprietarios[i];
        fwrite(&p, sizeof(Proprietario), 1, fp);
        fwrite(p.carros, sizeof(Carro), p.num_carros, fp);
    }

    fclose(fp);
}

void carregar_arquivo_binario() {
    FILE *fp = fopen("cadastro.bin", "rb");
    if (fp == NULL) {
        return;
    }

    fread(&num_proprietarios, sizeof(int), 1, fp);

    proprietarios = (Proprietario *)malloc(num_proprietarios * sizeof(Proprietario));

    for (int i = 0; i < num_proprietarios; i++) {
        fread(&proprietarios[i], sizeof(Proprietario), 1, fp);
        proprietarios[i].carros = (Carro *)malloc(proprietarios[i].num_carros * sizeof(Carro));
        fread(proprietarios[i].carros, sizeof(Carro), proprietarios[i].num_carros, fp);
    }

    fclose(fp);
}

void cadastrar_proprietario() {
    if (num_proprietarios == capacidade_proprietarios) {
        capacidade_proprietarios = capacidade_proprietarios == 0 ? 1 : capacidade_proprietarios * 2;
        proprietarios = realloc(proprietarios, capacidade_proprietarios * sizeof(Proprietario));
    }

    Proprietario p;
    printf("CPF do proprietário: ");
    scanf("%s", p.cpf);
    
    // Verificar se o proprietário com o CPF informado já existe
    for (int i = 0; i < num_proprietarios; i++) {
        if (strcmp(proprietarios[i].cpf, p.cpf) == 0) {
            printf("Proprietário com o CPF informado já existe.\n");
            return;
        }
    }

    printf("Nome do proprietário: ");
    scanf("%s", p.nome);
    p.num_carros = 0;
    p.capacidade_carros = 0;
    p.carros = NULL;

    proprietarios[num_proprietarios] = p;
    num_proprietarios++;
}


void cadastrar_carro() {
    if (num_proprietarios == 0) {
        printf("Nenhum proprietário cadastrado.\n");
        return;
    }

    char cpf[15];
    printf("CPF do proprietário: ");
    scanf("%s", cpf);

    Proprietario *p = NULL;
    for (int i = 0; i < num_proprietarios; i++) {
        if (strcmp(proprietarios[i].cpf, cpf) == 0) {
            p = &proprietarios[i];
            break;
        }
    }

    if (p == NULL) {
        printf("Proprietário não encontrado.\n");
        return;
    }

    if (p->num_carros == p->capacidade_carros) {
        p->capacidade_carros = p->capacidade_carros == 0 ? 1 : p->capacidade_carros * 2;
        p->carros = realloc(p->carros, p->capacidade_carros * sizeof(Carro));
    }

    Carro c;
    printf("Marca do carro: ");
    scanf("%s", c.marca);
    printf("Modelo do carro: ");
    scanf("%s", c.modelo);
    printf("Placa do carro: ");
    scanf("%s", c.placa);
    printf("Ano do carro: ");
    scanf("%d", &c.ano);

    p->carros[p->num_carros] = c;
    p->num_carros++;
}

void listar_proprietarios() {
    for (int i = 0; i < num_proprietarios; i++) {
        Proprietario p = proprietarios[i];
        printf("Nome: %s\n", p.nome);
        printf("CPF: %s\n", p.cpf);
        printf("Carros:\n");
        for (int j = 0; j < p.num_carros; j++) {
            Carro c = p.carros[j];
            printf("\tMarca: %s\n", c.marca);
            printf("\tModelo: %s\n", c.modelo);
            printf("\tPlaca: %s\n", c.placa);
            printf("\tAno: %d\n", c.ano);
        }
        printf("\n");
    }
}

int main() {
    carregar_arquivo_binario();

    int opcao;
    do {
        printf("\n\n===================== CADASTRO PROPRIETÁRIOS DE CARROS ===================== \n\n");
        printf("Digite 1: Cadastrar proprietário\n");
        printf("Digite 2: Cadastrar carro\n");
        printf("Digite 3: Listar proprietários\n");
        printf("Digite 4: Salvar dados no arquivo\n");
        printf("Digite 0: Sair\n\n");
        printf("Opção: ");
        scanf("%d", &opcao);

        switch (opcao) {
            case 1:
                cadastrar_proprietario();
                break;
            case 2:
                cadastrar_carro();
                break;
            case 3:
                listar_proprietarios();
                break;
            case 4:
                salvar_arquivo_binario();
                break;
            case 0:
                break;
            default:
                printf("Opção inválida.\n");
        }
    } while (opcao != 0);

    for (int i = 0; i < num_proprietarios; i++) {
        free(proprietarios[i].carros);
    }
    free(proprietarios);

    return 0;
}
