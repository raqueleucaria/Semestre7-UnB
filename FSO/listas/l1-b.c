#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>

int main(int argc, char **argv) {
    void *handle;               // Ponteiro para biblioteca dinamica
    char *error;
    int (*imprime)(void);       // Ponteiro para funcao "imprime"
    int (*calcula)(int, int);   // Ponteiro para funcao "calcula"
    int intParam1, intParam2;   // Parametros inteiros
    double (*trigo)(double);    // Ponteiro para funcao "trigo"
    double doubleParam;         // Parametro de ponto flutuante

    handle = dlopen(argv[1], RTLD_LAZY);
    error = dlerror();

    if (!handle || error != NULL) {
        printf("nao disponivel\n");
        return 1;               // Retorno de erro
    }

    imprime = dlsym(handle, "imprime");
    error = dlerror();

    if (!imprime || error != NULL) {
        printf("nao implementado\n");
    } else {
        printf("%d\n", imprime());
    }

    calcula = dlsym(handle, "calcula");
    error = dlerror();

    if (!calcula || error != NULL) {
        printf("nao implementado\n");
    } else {
        intParam1 = atoi(argv[2]);
        intParam2 = atoi(argv[3]);
        printf("%d\n", calcula(intParam1, intParam2));
    }

    trigo = dlsym(handle, "trigo");
    error = dlerror();

    if (!trigo || error != NULL) {
        printf("Nao implementado\n");
    } else {
        doubleParam = strtod(argv[4], NULL);
        printf("%d\n", trigo(doubleParam));
    }

    dlclose(handle);

    return 0;
}
