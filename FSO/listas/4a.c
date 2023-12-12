#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <elf.h>

void listarSimbolosElf(FILE *binario) {
    Elf64_Ehdr cabecalhoElf;
    fread(&cabecalhoElf, sizeof(Elf64_Ehdr), 1, binario);

    if (ferror(binario)) {
        printf("nao disponivel\n");
        return;
    }

    Elf64_Shdr secaoSimbolosDinamicos, secaoStringsDinamicas;
    int encontrouSimbolosDinamicos = 0, encontrouStringsDinamicas = 0;

    fseek(binario, cabecalhoElf.e_shoff, SEEK_SET);

    for (int i = 0; i < cabecalhoElf.e_shnum; i++) {
        fread(&secaoSimbolosDinamicos, sizeof(Elf64_Shdr), 1, binario);

        if (secaoSimbolosDinamicos.sh_type == SHT_DYNSYM) {
            encontrouSimbolosDinamicos = 1;
            break;
        }
    }

    for (int i = 0; i < cabecalhoElf.e_shnum; i++) {
        fread(&secaoStringsDinamicas, sizeof(Elf64_Shdr), 1, binario);

        if (secaoStringsDinamicas.sh_type == SHT_STRTAB && i != cabecalhoElf.e_shstrndx) {
            encontrouStringsDinamicas = 1;
            break;
        }
    }

    if (!encontrouSimbolosDinamicos || !encontrouStringsDinamicas) {
        printf("nao disponivel\n");
        return;
    }

    fseek(binario, secaoSimbolosDinamicos.sh_offset, SEEK_SET);
    Elf64_Sym *bufferSimbolos = malloc(secaoSimbolosDinamicos.sh_size);
    fread(bufferSimbolos, 1, secaoSimbolosDinamicos.sh_size, binario);

    if (ferror(binario)) {
        printf("nao disponivel\n");
        free(bufferSimbolos);
        return;
    }

    char *bufferStrings = malloc(secaoStringsDinamicas.sh_size);
    fseek(binario, secaoStringsDinamicas.sh_offset, SEEK_SET);
    fread(bufferStrings, 1, secaoStringsDinamicas.sh_size, binario);

    if (ferror(binario)) {
        printf("nao disponivel\n");
        free(bufferSimbolos);
        free(bufferStrings);
        return;
    }

    for (int i = 0; i < secaoSimbolosDinamicos.sh_size / sizeof(Elf64_Sym); i++) {
        if (bufferSimbolos[i].st_name == 0) {
            printf("\n");
        } else {
            char *nomeCompleto = bufferStrings + bufferSimbolos[i].st_name;
            char *arobase = strchr(nomeCompleto, '@');
            if (arobase != NULL) {
                printf("%.*s\n", (int)(arobase - nomeCompleto), nomeCompleto);
            } else {
                printf("%s\n", nomeCompleto);
            }
        }
    }

    free(bufferSimbolos);
    free(bufferStrings);
}

int main(int argc, char **argv) {
    if (argc != 2) {
        printf("nao disponivel\n");
        return 0;
    }

    const char *caminhoBinario = argv[1];
    FILE *arquivoBinario = fopen(caminhoBinario, "rb");

    if (arquivoBinario == NULL) {
        printf("nao disponivel\n");
        return 0;
    }

    listarSimbolosElf(arquivoBinario);

    fclose(arquivoBinario);
    return 0;
}
