using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;

namespace banco
{
    internal class Funcionario:Conexao
    {
        public int id;
        public int id_empresa;
        public int nivel;
        public string nome;
        public string email;
        public string senha;

        public DateTime data_cadastro;

        public List<Funcionario> GetListaClientes()
        {

            List<Funcionario> funcionarios = new List<Funcionario>();

            try
            {
                OpenConnection();

                string query = "SELECT * FROM funcionarios";

                using (MySqlCommand cmd = new MySqlCommand(query, connection))
                {

                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {

                        while (reader.Read())
                        {


                            Funcionario novoFuncionario = new Funcionario();

                            novoFuncionario.id = Convert.ToInt32(reader.GetString("id"));
                            novoFuncionario.id_empresa = Convert.ToInt32(reader.GetString("id_empresa"));
                            novoFuncionario.nivel = Convert.ToInt32(reader.GetString("nivel"));

                            novoFuncionario.nome = reader.GetString("nome");
                            novoFuncionario.email = reader.GetString("email");
                            novoFuncionario.senha = reader.GetString("senha");

                            novoFuncionario.data_cadastro = DateTime.Parse(reader.GetString("data_cadastro"));


                            funcionarios.Add(novoFuncionario);
                        }
                    }
                }

                CloseConnection();

            }
            catch (Exception exception)
            {
                throw new Exception(exception.Message);
            }

            return funcionarios;
        }




    }
}
