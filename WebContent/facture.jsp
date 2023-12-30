<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Gestion Des Commandes</title>
</head>
<body class="bg-dark text-light">

<%
    // Retrieve parameters
    String client = request.getParameter("nomClient");
    String address = request.getParameter("adresseClient");
    String email = request.getParameter("emailClient");
    String facture = request.getParameter("Facturenum");

    // Product details in an array
    String[] products = {"Ordinateur Portable, Macbook Pro M2", "Imprimante Hp Pro 7740", "Disque dur SSD 500GO"};
    int[] quantities = {Integer.parseInt(request.getParameter("LaptopQte")),
                        Integer.parseInt(request.getParameter("PrinterQte")),
                        Integer.parseInt(request.getParameter("SSDQte"))};
    int[] prices = {Integer.parseInt(request.getParameter("LaptopPrixUnit")),
                    Integer.parseInt(request.getParameter("PrinterPrixUnit")),
                    Integer.parseInt(request.getParameter("SSDPrixUnit"))};

    // Perform calculations
    int[] totalHt = new int[3];
    int totalNetHt = 0;
    for (int i = 0; i < products.length; i++) {
        totalHt[i] = quantities[i] * prices[i];
        totalNetHt += totalHt[i];
    }
    double tva =  Math.round(totalNetHt * 0.2);
    double remise = totalNetHt * 0.08;
    double totalTTC = Math.round(totalNetHt + tva - remise);
%>

<div class="col-md-8">
    <div class="card card-user">
        <div class="card-header">
            <!-- Header content goes here if needed -->
        </div>
        <div class="card-body">
            <h3 class="card-title pl-4">Facture</h3>

            <form>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-dark">
                        <thead class="thead-dark">
                            <tr>
                                <th>Description</th>
                                <th>Quantité</th>
                                <th>Prix Unitaire</th>
                                <th>Total Ht</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (int i = 0; i < products.length; i++) { %>
                                <tr>
                                    <td><%= products[i] %></td>
                                    <td><input type="text" class="form-control" value="<%= quantities[i] %>" name="quantite<%= i+1 %>" disabled></td>
                                    <td><input type="text" class="form-control" value="<%= prices[i] %>" name="PrixUnitaire<%= i+1 %>" disabled></td>
                                    <td><input type="text" class="form-control" name="TotalHt<%= i+1 %>" value="<%= totalHt[i] %>" disabled></td>
                                </tr>
                            <% } %>
                            <!-- Other rows ... -->
                            <tr>
                                <td><b>Conditions de paiement</b></td>
                                <td></td>
                                <td><b>Total net HT</b></td>
                                <td><input type="text" class="form-control" name="TotalNetHt" value="<%=totalNetHt%>" disabled></td>
                            </tr>
                            <tr>
                                <td>Les modes de paiement acceptés incluent le chèque, le virement bancaire et la carte de crédit</td>
                                <td></td>
                                <td><b>TVA</b></td>
                                <td><input type="text" class="form-control" name="TVA" value="<%=tva%>" disabled></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td><b>Remise</b></td>
                                <td><input type="text" class="form-control" name="remise" value="<%=remise%>" disabled></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td><b>Total TTC</b></td>
                                <td><input type="text" class="form-control" name="totalTTC" value="<%=totalTTC%>" disabled></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </form>
        </div>
    </div>
</div>


</body>
</html>





