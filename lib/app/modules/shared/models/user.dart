class UserModel {
  int id;
  String nome;
  String email;
  String senha;
  String telefone;
  String bairro;
  String cidade;
  String uf;
  bool premium;

  UserModel(
      {this.id,
      this.nome,
      this.email,
      this.senha,
      this.telefone,
      this.bairro,
      this.cidade,
      this.uf,
      this.premium});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
    senha = json['senha'];
    telefone = json['telefone'];
    bairro = json['bairro'];
    cidade = json['cidade'];
    uf = json['uf'];
    premium = json['premium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['senha'] = this.senha;
    data['telefone'] = this.telefone;
    data['bairro'] = this.bairro;
    data['cidade'] = this.cidade;
    data['uf'] = this.uf;
    data['premium'] = this.premium;
    return data;
  }
}