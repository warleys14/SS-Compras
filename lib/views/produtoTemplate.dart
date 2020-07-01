import 'package:flutter/material.dart';
import 'package:minhas_compras/models/produto.dart';
import 'package:minhas_compras/views/editProduto.dart';

/* É basicamente a tela que representa e cria a estrutura basica de um produto, e retorna isso para categoria,
que vai retornar para tela inicial*/
class ProdutoTemplate extends StatelessWidget {
  final Produto produto;
  final Function delproduto;
  final Function editproduto;

  ProdutoTemplate(
      {@required this.produto,
      @required this.delproduto,
      @required this.editproduto});

  @override
  Widget build(BuildContext context) {
    String pNome = produto.nome;
    String pQuantidade = produto.quantidade;
    String pCategoria = produto.categoria;
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Dialog(
                child:
                    EditarProduto(produto: produto, editproduto: editproduto),
              ))),
      child: Card(
        margin: EdgeInsets.fromLTRB(6, 9, 6, 9),
        elevation: 7,
        child: ListTile(
          leading: Image.asset(
            'assets/images/$pCategoria.png',
            width: 30,
            height: 30,
          ),
          title: Text(
            pNome,
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text(
            "$pQuantidade",
            style: TextStyle(fontSize: 20),
          ),
          trailing: IconButton(
              icon: const Icon(Icons.delete),
              color: Theme.of(context).errorColor,
              onPressed: () => delproduto(produto.id)),
        ),
      ),
    );
  }
}
