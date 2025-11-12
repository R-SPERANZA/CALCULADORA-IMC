using System;

public class ImcCalculator
{
    // Função para calcular o IMC
    public static double CalcularImc(double peso, double altura)
    {
        if (altura <= 0 || peso <= 0)
        {
            throw new ArgumentException("Peso e altura devem ser valores positivos.");
        }

        // IMC = peso / (altura * altura)
        return peso / (altura * altura);
    }

    // Função para classificar o IMC
    public static string ClassificarImc(double imc)
    {
        if (imc < 18.5)
        {
            return "Abaixo do peso";
        }
        else if (imc >= 18.5 && imc < 24.9)
        {
            return "Peso normal";
        }
        else if (imc >= 25.0 && imc < 29.9)
        {
            return "Sobrepeso";
        }
        else if (imc >= 30.0 && imc < 34.9)
        {
            return "Obesidade Grau I";
        }
        else if (imc >= 35.0 && imc < 39.9)
        {
            return "Obesidade Grau II (Severa)";
        }
        else
        {
            return "Obesidade Grau III (Mórbida)";
        }
    }

    // Método principal para rodar a aplicação de console
    public static void Main(string[] args)
    {
        Console.WriteLine("--- Calculadora de Índice de Massa Corporal (IMC) ---");

        try
        {
            // Solicita a altura em metros
            Console.Write("Digite sua altura em metros (ex: 1.75): ");
            string alturaStr = Console.ReadLine();
            double altura = double.Parse(alturaStr.Replace(',', '.'), System.Globalization.CultureInfo.InvariantCulture);

            // Solicita o peso em quilogramas
            Console.Write("Digite seu peso em quilogramas (ex: 70.5): ");
            string pesoStr = Console.ReadLine();
            double peso = double.Parse(pesoStr.Replace(',', '.'), System.Globalization.CultureInfo.InvariantCulture);

            double imc = CalcularImc(peso, altura);
            string classificacao = ClassificarImc(imc);

            Console.WriteLine("\n--- Resultado ---");
            Console.WriteLine($"Seu IMC é: {imc:F2}");
            Console.WriteLine($"Classificação: {classificacao}");
            Console.WriteLine("-----------------");
        }
        catch (FormatException)
        {
            Console.WriteLine("\nErro: Por favor, digite valores numéricos válidos para peso e altura.");
        }
        catch (ArgumentException ex)
        {
            Console.WriteLine($"\nErro: {ex.Message}");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"\nOcorreu um erro inesperado: {ex.Message}");
        }
    }
}
