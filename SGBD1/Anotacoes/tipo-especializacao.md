# Tipos de Especialização

## Parcial (p)
- Uma entidade na super-classe não precisa estar necessariamente atrelada a pelo menos uma das sub-classes da especialização.
- Podem ter funcionário que não é nem engenheiro nem motorista, pode isso existe um atributo chamado cargo, na entidade funcionário

    ![Alt text](image-2.png)

## Total (t)
- Toda entidade da super-classe pai precisa estar associada a pelo menos uma entidade da subclasse filha
- Para cada ocorrencia na entiedade generica existe uma ocorrencia nas entidades especializadas
- Sempre quando for cadastrado um cliente, deverá ser cadastrado ou uma pessoa física ou uma 
  ![Alt text](image-3.png)


## Exclusiva
- A super classe precisa esta associada a apenas uma subclasse
- A entidade super-classe deve estar atrelada a no máximo uma das sub-classes da especialização
  ![Alt text](image-4.png)

## Não exclusiva
- Um registro na entidade generica pode aparecer em diversas especializações
- Uma pessoa pode ser:
  -  professor
  -  funcionário
  -  aluno
  -  professor e funcionário
  -  funcionário e aluno
  -  professor e aluno
  -  professor, funcionário e aluno. 
- ![Alt text](image-5.png)

# Nível lógico
- Especialização total

    ![Alt text](image-7.png)
    ![Alt text](image-6.png)

- Especialização total exclusiva
    ![Alt text](image-23.png)
    ![Alt text](image-24.png)
    ![Alt text](image-25.png)

    ![Alt text](image-26.png)
    ![Alt text](image-27.png)
    ![Alt text](image-28.png)
    
- Especialização parcial não exclusivo

    ![Alt text](image-9.png)
    ![Alt text](image-10.png)

    ![Alt text](image-14.png)
    ![Alt text](image-17.png)

    ![Alt text](image-18.png)
    ![Alt text](image-21.png)
    ![Alt text](image-20.png)
    ![Alt text](image-22.png)

- Especialização parcial

    ![Alt text](image-11.png)

    ![Alt text](image-12.png) ->gera atributos nulos

    ![Alt text](image-13.png)