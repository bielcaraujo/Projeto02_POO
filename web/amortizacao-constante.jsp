<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Constante(SAC)</title>
    </head>
    <body>
              <h1>Amortização Constante(SAC)</h1>
        <%
        int tempo = 0;
        double amortizacao = 0;
        double juros = 0;
        double divida = 0;
        double parcela= 0;
        
        %>
        <form>
            Divida a ser paga: <input type='number' step='0.01' min='1' name = 'divida' value = '<%=divida%>'/><br/>
           Juros: <input type='number' step='0.01' min='1' name = 'juros' value = '<%=juros%>'/><br/>
           Tempo*: <input type='number' step='0.01' min='1' name = 'tempo' value = '<%=tempo%>'/><br/>
           <input type='submit' value ='Gerar'/>
             </form>
           <%
               try{
                if(request.getParameter("divida")!= null){
                divida = Double.parseDouble(request.getParameter("divida"));
                }
               }
            catch(Exception ex){
                out.println("<span style='color:red;'>Você entrou com um número no formato inválido no campo de Divida. Tente novamente: </span><br>");
            }
               
               
            try{
                if(request.getParameter("juros")!= null){
                juros = Double.parseDouble(request.getParameter("juros"));
                }
            }
            catch(Exception ex){
                out.println("<span style='color:red;'>Você entrou com um número no formato inválido no campo Juros. Tente novamente: </span><br>");
            }
            try{
                if(request.getParameter("tempo")!= null){
                tempo = Integer.parseInt(request.getParameter("tempo"));
                }
            }
            catch(Exception ex){
                out.println("<span style='color:red;'>Você entrou com um número no formato inválido no campo de Tempo. Tente novamente: </span><br>");
            }
               %>
               <table border="1">
                   <tr>
                       <th>Período</th>
                       <th>Amortização</th>
                       <th>Juros</th>
                       <th>Parcela</th>
                       <th>Dívida</th>
                   </tr>
                            <%
                               
                               for(int i= 0; i<= tempo; i++){
                                   %><tr><%
                                        out.println(i);
                                       %><td><%
                                        out.println(amortizacao);
                                       %></td>
                                       %><td><%
                                           if (i == 0){
                                               out.println("0");
                                           }
                                           else{
                                        out.println(juros);
                                           }
                                       %></td>
                                       %><td><%
                                        out.println(parcela);
                                       %></td>
                                       %><td><%
                                        out.println(divida);
                                       %></td>
                                   </tr>
                                   <%
                                       amortizacao = divida/tempo;
                                       juros = divida*(juros/100);
                                       parcela = amortizacao + juros;
                                       divida = divida - amortizacao;
                                   %>
                                      

                              }

                               %>   
               </table>
    </body>
</html>
