using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization.Formatters;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace banco
{
    internal class Program
    {
        static void Main(string[] args)
        { 
            Funcionario funcionarios = new Funcionario();


            foreach (Funcionario funcionario in funcionarios.GetListaClientes()) 
            {

                Console.WriteLine("ID : " + funcionario.id);
                Console.WriteLine("ID_EMPRESA: " + funcionario.id_empresa);
                Console.WriteLine("NIVEL : " + funcionario.nivel);

                Console.WriteLine("NOME : " + funcionario.nome);
                Console.WriteLine("EMAIL : " + funcionario.email);
                Console.WriteLine("SENHA : " + funcionario.senha);
                Console.WriteLine("DATA DE CADASTRO : " + funcionario.data_cadastro);

            }
                Console.ReadLine();


        }
    }
}



//Console.WriteLine("Digite o insumo de numero [i]"); //vai ter textbox pra isso talvez não precise.
//numeroDeInsumos = Convert.ToDouble(Console.ReadLine());

//
//     ____________
//    / /|      |\ \  
//   { }|/o v o\|{ }

//


