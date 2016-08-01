<%@ Page Title="Products" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.vb" Inherits="VbWebFormsAppWithWebApi.Contact" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script type="text/javascript">
        'use strict';

        function getProducts() {
            const products = $('#products');

            $.getJSON("api/allproducts", data => {
                products.empty();

                    $.each(data, (key, val) => {
                        let row = `<tr><td>${val.Name}</td>
                            <td>${val.Price}</td>
                            <td>${val.Category}</td>
                            <td>${val.UpdateTime}</td>
                            </tr>`;

                        products.append($(row));
                    });
                });
        }

        function onLoad() {
            getProducts();

            $('#reloadTable').click(e => {
                e.preventDefault();
                getProducts();

                return false;
            });
        }

        $(document).ready(onLoad);
    </script>
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>Products</h2>

    <table class="table productTable">
        <thead>
            <tr>
                <th>Name</th>
                <th>Price</th>
                <th>Category</th>
                <th>Update Time</th>
            </tr>
        </thead>
        <tbody id="products">
        </tbody>
    </table>
    <br />
    <p><a id="reloadTable" href="#" class="btn btn-default">Reload</a></p>
</asp:Content>