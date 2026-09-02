<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="br.edu.ifpr.irati.ads.model.Endereco" %>
<%@ page import="java.util.List" %>
<%
    List<Endereco> enderecos = (List<Endereco>) session.getAttribute("enderecos");
    if (enderecos == null){
        response.sendRedirect("endereco.jsp");
        return;
    }
    Endereco endereco = (Endereco) session.getAttribute("endereco");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Cadastro de Usuários</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">

    <% if (endereco.getId() != 0){ %>
    <script type="text/javascript">
        window.onload = () => {
            new bootstrap.Modal('#cadastroModal').show();
        }
    </script>
    <%}%>

</head>
<body>
<div class="container">
    <div class="row">
        <div class="col">
            <table class="table table-hover table-responsive">
                <thead>
                <tr>
                    <th scope="col">Logradouro</th>
                    <th scope="col">Número</th>
                    <th scope="col">Bairro</th>
                    <th scope="col">Cidade</th>
                    <th scope="col">Estado</th>
                    <th scope="col">CEP</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <% for (Endereco u: enderecos) { %>
                <tr>
                    <td><%=u.getLogradouro()%></td>
                    <td><%=u.getNumero()%></td>
                    <td><%=u.getBairro()%></td>
                    <td><%=u.getCidade()%></td>
                    <td><%=u.getEstado()%></td>
                    <td><%=u.getCep()%></td>
                    <td class="text-end">
                        <a class="btn btn-success" href="endereco.jsp?operation=update&id=<%=u.getId()%>" role="button">Alterar</a>
                        <a class="btn btn-danger" href="endereco.jsp?operation=delete&id=<%=u.getId()%>" role="button">Excluir</a>
                    </td>
                </tr>
                <%}%>

                </tbody>
            </table>
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#cadastroModal">
                Novo usuário
            </button>
        </div>
    </div>
</div>

<form action="endereco.jsp" method="get">
    <div class="modal" tabindex="-1" id="cadastroModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Usuário</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden"
                           class="form-control"
                           id="id"
                           name="id"
                           value="<%=endereco.getId()%>">
                    <div class="mb-3">
                        <label for="logradouro" class="form-label">Logradouro</label>
                        <input type="text"
                               class="form-control"
                               id="logradouro"
                               aria-describedby="logradouroHelp"
                               name="logradouro"
                               value="<%=endereco.getLogradouro()%>">
                        <div id="logradouroHelp" class="form-text">Digite um logradouro válido.</div>
                    </div>
                    <div class="mb-3">
                        <label for="numero" class="form-label">Número</label>
                        <input type="number"
                               class="form-control"
                               id="numero"
                               aria-describedby="numeroHelp"
                               name="numero"
                               value="<%=endereco.getNumero()%>">
                        <div id="numeroHelp" class="form-text">Digite um número de casa válido.</div>
                    </div>
                    <div class="mb-3">
                        <label for="bairro" class="form-label">Bairro</label>
                        <input type="text"
                               class="form-control"
                               id="bairro"
                               aria-describedby="bairroHelp"
                               name="bairro"
                               value="<%=endereco.getBairro()%>">
                        <div id="bairroHelp" class="form-text">Digite um bairro válido.</div>
                    </div>
                    <div class="mb-3">
                        <label for="cidade" class="form-label">Cidade</label>
                        <input type="text"
                               class="form-control"
                               id="cidade"
                               aria-describedby="cidadeHelp"
                               name="cidade"
                               value="<%=endereco.getCidade()%>">
                        <div id="cidadeHelp" class="form-text">Digite uma cidade válida.</div>
                    </div>
                    <div class="mb-3">
                        <label for="estado" class="form-label">Estado</label>
                        <input type="text"
                               class="form-control"
                               id="estado"
                               aria-describedby="estadoHelp"
                               name="estado"
                               value="<%=endereco.getEstado()%>">
                        <div id="estadoHelp" class="form-text">Digite um estado válido.</div>
                    </div>
                    <div class="mb-3">
                        <label for="cep" class="form-label">CEP</label>
                        <input type="text"
                               class="form-control"
                               id="cep"
                               aria-describedby="cepHelp"
                               name="cep"
                               value="<%=endereco.getCep()%>">
                        <div id="cepHelp" class="form-text">Digite um CEP válido.</div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button id="cancel" type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary">Salvar</button>
                </div>
            </div>
        </div>
    </div>
</form>

<script type="text/javascript">
    document.getElementById("cancel").addEventListener("click", () => window.location.href = "endereco.jsp");
</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>
