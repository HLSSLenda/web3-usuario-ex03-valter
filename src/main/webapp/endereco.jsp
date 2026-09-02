<%@ page import="br.edu.ifpr.irati.ads.model.Endereco" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="br.edu.ifpr.irati.ads.dao.HibernateUtil" %>
<%@ page import="br.edu.ifpr.irati.ads.dao.GenericDao" %>
<%@ page import="br.edu.ifpr.irati.ads.dao.Dao" %>
<%@ page import="org.hibernate.HibernateException" %>
<%
    try (Session bdSession = HibernateUtil.getSessionFactory().openSession()) {
        Dao<Endereco> usuarioDao = new GenericDao<>(Endereco.class, bdSession);

        String operation = request.getParameter("operation");
        Long id = null;
        try{
            id = Long.parseLong(request.getParameter("id"));
        } catch (NumberFormatException nfe) { }

        Endereco enderecoSessao;
        if (operation != null && operation.equals("delete")) {
            Endereco enderecoExcluir = usuarioDao.buscarPorId(id);
            usuarioDao.excluir(enderecoExcluir);
            enderecoSessao = new Endereco();
        } else if (operation != null && operation.equals("update")) {
            enderecoSessao = usuarioDao.buscarPorId(id);
        } else {
            String logradouro = request.getParameter("logradouro");
            String numeroRaw = request.getParameter("numero");
            String bairro = request.getParameter("bairro");
            String cidade = request.getParameter("cidade");
            String estado = request.getParameter("estado");
            String cep = request.getParameter("cep");
            int numero;
            try {
                numero = Integer.parseInt(numeroRaw);
            } catch (Exception e) {
                numero = 0;
            }

            if (id != null && id == 0) {//salvar novo
                Endereco endereco = new Endereco(id, logradouro, numero, bairro, cidade, estado, cep);
                usuarioDao.salvar(endereco);
                enderecoSessao = new Endereco();
            } else if (id != null){//atualizar registro
                Endereco endereco = usuarioDao.buscarPorId(id);
                endereco.setLogradouro(logradouro);
                endereco.setNumero(numero);
                endereco.setBairro(bairro);
                endereco.setCidade(cidade);
                endereco.setEstado(estado);
                endereco.setCep(cep);
                usuarioDao.alterar(endereco);
                enderecoSessao = new Endereco();
            } else {//request sem passagem de parâmetros
                enderecoSessao = new Endereco();
            }
        }
        session.setAttribute("endereco", enderecoSessao);
        session.setAttribute("enderecos", usuarioDao.buscarTodos());
        response.sendRedirect("index.jsp");
    }catch (HibernateException he){
        throw new Exception("Conexão com o banco de dados indisponível.", he);
    }
%>
