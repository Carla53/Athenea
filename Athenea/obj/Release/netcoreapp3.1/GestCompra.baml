   M S B A M L   `   `   `  ���� B  >Athenea, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:AtheneaAthenea      Athenea.GestCompra   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     'localclr-namespace:Athenea     c _MaterialDesignThemes.MahApps, Version=0.2.7.0, Culture=neutral, PublicKeyToken=df2a72020bd7962a_ [MaterialDesignThemes.Wpf, Version=4.7.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aHmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes     N� Title$  Gestionar Ventas��   MaterialDesignBody#���   $
��Bold"�$��16(� N� 
FontFamily$X Rpack://application:,,,/MaterialDesignThemes.Wpf;component/Resources/Roboto/#Roboto)�.��� -    �Name$ GestionPapeleria��$��1��
�������$
{�True��$y�Visible=�.+�� -   $ gContenidoPap��
�������$
{�True��$y�Visible=�$��Stretch=� � RowDefinitions �� $��60 ��� $	��53* ��� $	��68* ��� $��46.402 ��� $	��53* ��� $	��53* ��� $��60 ��� $	��53* ��� $	��53* � � ColumnDefinitions �� $	��97* ��� $	��63* �.+��  � Orientation$ 
Horizontal=�$
��Left=�$��Bottom=�$��5,0,0,5q�$��0��$��2��$	��301��$��43��$��2��.+��� -    ��Name$ txtBusquedaPap��$��0��$
��Left=�$	��201�� % !MaterialDesignFloatingHintTextBox#��[ )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Producto a buscar��$��Center=��� -    ��Name$ btnBuscarPap��	 � ToolTip$	 Buscar producto��$��85��$��38��$
��Left=�$	��Top=� " MaterialDesignFlatDarkBgButton#���  $��0q�$��10,5,0,0q�
 � Cursor$

 Hand����0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$ Search=�   Size 25� $ 
Horizontal=�$
��Left=�$��Bottom=�$��5,0,0,5q�$��0��$	��301��$��43��.+��� -   $ txtBusquedaLi��$��0��$
��Left=�$	��201��#��[ $ Libro a buscar��$��Center=��� -   $ btnBuscarLibros��$��85��$��38��$
��Left=�$	��Top=�#���  $��0q�$��10,5,0,0q�$

 Hand����  $ Search=� 25&   System.Windows.Controls.DataGrid  -     Name$ dgPapeleria��   
IsReadOnly$
 true��   SelectionMode$ Single=�$��0,5,0,5q�   AutoGenerateColumns$ False��$��2��$��4��$��Center=�$��Center=�   Columns 4  .System.Windows.Controls.DataGridTemplateColumn  ,  &System.Windows.Controls.DataGridColumn   Width5  /System.Windows.Controls.DataGridLengthConverter$ 70    CellTemplate �� .R��� ���� *Imagen+0  *System.Windows.Controls.DataGridTextColumn     Header$ Nombre��1  +System.Windows.Controls.DataGridBoundColumn   Binding ��  �� Path$ Nombre�  $ 	Categoria�� �� $ Categoria.Nombre�  $ Stock�� �� $ Stock�  $ Precio�� �� $ Precio�  $ Marca�� �� $ Marca.Nombre�  $ Color�� �� $ Color�  $ Tamaño�� �� $ Tamaño�  $ 
Prooveedor�� �� $ Proveedor.Nombre�  -   $ dgLibros��$
 true��$ Single=�$��0,5,0,5q�$   HorizontalScrollBarVisibility$
 Auto=�$ False��$��2��$��Center=�$��Center=�$��1��   $ 70  �� .R��� ���� *Imagen+  $ Título�� �� $ Nombre�  $
 ISBN�� �� $
 ISBN�  $ Autor�� �� $ Autor�  $
 Tipo�� �� $ Tipo.Nombre�  $ 	Editorial�� �� $ Editorial.Nombre�  $ Descripción�� �� $ Descripcion�  $ Stock�� �� $ Stock�  $ Precio�� �� $ Precio�  $ Edicion�� �� $ Edicion�  $ 
Prooveedor�� �� $ Proveedor.Nombre�� $ 
Horizontal=�$
��Left=�$��Bottom=�$��5,0,0,5q�$��0��$��6��$	��301��$��43��.+��� -	   $ txtBusquedaPro��$��0��$
��Left=�$	��201��#��[ $ Proveedor a buscar��$��Center=��� -
   $ btnBuscarProveedores��$	 Buscar proveedor��$��85��$��38��$
��Left=�$	��Top=�#���  $��0q�$��10,5,0,0q�$

 Hand����  $ Search=� 25  -   $ dgProveedores��$
 true��$��0,5,0,5q�$ Single=�$
 Auto=�$ False��$��2��$��Center=�$��Center=�$��7��   $	 CIF�� �� $	 CIF�  $ Nombre�� �� $ NombreCompleto�  $ Correo�� �� $ Correo�  $ 	Teléfono�� �� $ Telefono�  $ 	Direccion�� �� $ 	Direccion�  $	 100  �� .R��� ���� *Imagen+�� -    ��Name$ gbFormularioProducto��$'��!Datos para la compra del producto��  MaterialDesignGroupBox#���  $��0��$��3��$��1��$��5,10,5,0q�.��� -   $ gContenedorDireccion��$

 Hand�� �� $��* ��� $��* ��� $��* � �� $��* ��� $��* �.+��� -    ��Name$ Imagen��$��0��$��0��$��2��$ Imagen��$

 Hand������ $ Imagen� �� Mode$ TwoWay=� �� NotifyOnValidationError$
 True�� �� UpdateSourceTrigger$ PropertyChanged=� �� ValidatesOnDataErrors$
 True���� -   $ 	txtNombre��$��0��$��1��$��0��$ Nombre��#��[ $��Center=�$��	10,0,10,0q����� $ Nombre�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� -   $ txtCantidad��$��1��$��1��$��1��$ Cantidad��#��[ $��Center=�$��	10,0,10,0q��� -   $ txtProveedor��$��2��$��1��$��2��$ 	Proveedor��#��[ $��Center=�$��	10,0,10,0q�� $ 
Horizontal=�$��Right=�$��Bottom=�$��0,0,5,5q�$��43��$��85��.+��� -   $ btnMostrarCompras��$��75��$��38��$	 Mostrar Compras��$
��Left=�$	��Top=�#���  $��0q�$��10,5,0,0q�$

 Hand����  $ ListBox=� 25� $ 
Horizontal=�$
��Left=�$��Center=�$��3��$��1��$��2��$��47��.+��� -   $ 
btnAñadir��$	 añadir producto��#���  $��14(�$��85��$��5,5,0,0q���  $ CartArrowDown=� 23�� -   $ 	btnBorrar��$	 quitar producto��#���  $��5,10,5,5q�$��85��$��14(�$

 Hand����  $ 
CartRemove=� 23� $ 
Horizontal=�$��Right=�$��1��$��3��$��Center=�$��37��$��90��.+��� -   $ 	btnCompra��$��Right=�$	 hacer compra��#���  $��14(�$��85��$��0,5,5,0q���  $ CartArrowRight=� 23  -   $ dgCompra��$
 true��$ Single=�$��5,5,5,5q�$ False��$��5��$��4��$��1��$��Center=�$��Center=�   $ Producto�� �� $ Producto.Nombre�  $ Importe�� �� $ Importe� �� StringFormat$ N2��  $ Cantidad�� �� $ Cantidad�'	  !MaterialDesignThemes.Wpf.Snackbar	  -    	 Name$ sbNotification��$	��Top=�$��Center=�  	  MessageQueue  4
  .MaterialDesignThemes.Wpf.MessageQueueExtension
  