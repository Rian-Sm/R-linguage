#Write a R program to take input from the user (name and age) and display the values. Also print the version of R installation. 
name = readline(prompt="Escreva seu nome: ")
age = readline(prompt="Escreva sua idade: ")

print(paste("My name is", name,"and I am", age, "years old"))