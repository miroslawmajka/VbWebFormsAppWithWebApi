Imports System.Web.Http
Imports System.Linq

Namespace Controllers
    Public Class ProductsController
        Inherits ApiController

        ''' <summary>
        ''' Sample AJAX data
        ''' </summary>
        Dim products As List(Of Product) = New List(Of Product)() From
        {
            New Product() With {
                .Id = 1,
                .Name = "Tomato Soup",
                .Category = "Groceries",
                .Price = 1},
            New Product() With {
                .Id = 2,
                .Name = "Yo-yo",
                .Category = "Toys",
                .Price = 3.75},
            New Product() With {
                .Id = 3,
                .Name = "Hammer",
                .Category = "Hardware",
                .Price = 16.99}
        }

        <Route("api/products")>
        Public Function GetAllProducts() As IEnumerable(Of Product)
            Return products
        End Function

        <Route("api/product/{id}")>
        Public Function GetProduct(ByVal id As Integer) As IHttpActionResult
            Dim product = products.FirstOrDefault(Function(p) p.Id = id)

            If product Is Nothing Then
                Return NotFound()
            End If

            Return Ok(product)
        End Function
    End Class
End Namespace