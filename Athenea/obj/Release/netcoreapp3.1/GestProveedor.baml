   M S B A M L   `   `   `  ���� B  >Athenea, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:AtheneaAthenea      Athenea.GestProveedor   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     'localclr-namespace:Athenea     c _MaterialDesignThemes.MahApps, Version=0.2.7.0, Culture=neutral, PublicKeyToken=df2a72020bd7962a_ [MaterialDesignThemes.Wpf, Version=4.7.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aHmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes     N� Title$  Gestionar Proveedores��   MaterialDesignBody#���   $
��Bold"�$��16(� N� 
FontFamily$X Rpack://application:,,,/MaterialDesignThemes.Wpf;component/Resources/Roboto/#Roboto)� � Cursor$
 Hand��.��� .+�� -    �Name$ gContenidoPro��
�������$
{�True��$y�Visible=� � RowDefinitions �� $��62 ��� $	��62* ��� $	��62* ��� $��62 ��� $	��62* ��� $	��62* ��� $��62 ��� $	��62* ��� $	��61* ��� $	��61* � � ColumnDefinitions �� $
��529* ��� ����  �� Path$ Width� �� ElementName$ gDatos���� ���� $ Width�$ gAñadirPro_Li��.+��  � Orientation$ 
Horizontal=�$
��Left=�$��Bottom=�$��0,0,0,5q�.+��� -   	 ��Name$	 btnNuevo��
 � ToolTip$
 limpiar formulario�� " MaterialDesignFlatDarkBgButton#���  $��14(�$
 Hand��$��90��$��11,5,0,0q���0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$ Clear=�   Size 24�� -   $	 btnGuardarProo��$
 registar��#���  $��14(�$��90��$��5,5,0,0q�$
 Hand����  $ UserPlus=� 24�� -   $	 btnBorrarProo��$
 eliminar��#���  $��5,5,0,0q�$��90��$��14(�$
 Hand����  $ Delete=� 24d� -    d�Name$ btnAñadirLi_Pro��$
 añadir productos��#���  $��5,5,0,0q�$��90��$��14(�$
 Hand����  $ PenPlus=� 24�� -    ��Name$ gbFormulario��$��Datos de prooveedor��  MaterialDesignGroupBox#���  $��0��$��
10,2,10,10q�$��1��$��6��.��� -   $ gContenedor5a��$
 Hand�� �� $��* ��� $��* ��� $��* ��� $��* � �� $��* ��� $��* �.+��� -    ��Name$ txtCIF��$��0��$��0��$��0��)  #MaterialDesignThemes.Wpf.HintAssist   Hint$	 CIF�� % !MaterialDesignFloatingHintTextBox#��[ $��Center=�$
��10,0q����� $	 CIF� �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=� �� NotifyOnValidationError$
 True�� �� ValidatesOnDataErrors$
 True���� -	   $ 	txtNombre��$��1��$��0��$��1��$ Nombre��#��[ $��Center=�$
��10,0q����� $ Nombre�$ TwoWay=�$ PropertyChanged=�$
 True��$
 True���� -
   $ 	txtSiglas��$��2��$��0��$��2��$ Siglas��#��[ $��Center=�$��	10,0,10,0q����� $ Siglas�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� -   $ cbCorreo��$��3��$��0��$��3��$ Correo��#��[ $��Center=�$��	10,0,10,0q����� $ Correo�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� -   $ txtTelefono��$��4��$��1��$��0��$ Telefono��#��[ $��Center=�$
��10,0q����� $ Telefono�$ TwoWay=�$ PropertyChanged=�$
 True��$
 True���� -    ��Name$ cbProductos��$��5��$��1��$��1��$ Productos que vende�� & "MaterialDesignFloatingHintComboBox#��[ $��Center=�$��	10,0,10,0q� �� Text �� $ Productos.Nombre�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� -   $ cbLibros��$��6��$��1��$��2��$ Libros que vende��#��[ $��Center=�$��	10,0,10,0q� �� $ Libros.Nombre�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� -   $ gbFormularioDireccion��$*��$Datos de la direccion del prooveedor��#���  $��7��$��3��$��0��$��
10,0,10,10q�.��� -   $ gContenedorDireccion��$
 Hand�� �� $��* ��� $��* � �� $��* ��� $��* �.+��� -   $ txtCalle��$��0��$��0��$��0�� �� 
IsReadOnly$
 True��$ Calle��#��[ $��Center=�$
��10,0q����� $ Calle�$ TwoWay=�$ PropertyChanged=�$
 True��$
 True���� -   $ txtCP��$��1��$��0��$��1��$
 True��$ Codigo Postal��#��[ $��Center=�$
��10,0q����� $ CodigoPostal�$ TwoWay=�$ PropertyChanged=�$
 True��$
 True���� -   $ txtProvincia��$��2��$��1��$��0��$
 True��$ 	Provincia��#��[ $��Center=�$��	10,0,10,0q����� $ 	Provincia�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� -   $ txtConcello��$��3��$��1��$��1��$
 True��$ Concello��#��[ $��Center=�$��	10,0,10,0q����� $ Concello�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True��� -   $ gDatos��$��1��$��10��$	��751�� �� $��62 ��� $	��62* ��� $	��62* ��� $	��50* ��� $	��62* ��� $	��62* ��� $	��50* ��� $	��62* ��� $	��62* ��� $	��62* �.+�� $ 
Horizontal=�$
��Left=�$��8,0,0,5q�$��Bottom=�$��0��.+��� -   $ txtBusquedaPro��$��0��$
��Left=�$	��201��#��[ $ Prooveedor a buscar��$��Center=��� -   $	 btnBuscarPro��$��85��$��38��$
 Buscar Proveedor��$
��Left=�$	��Top=�#���  $��16(�$��0q�$��10,5,0,0q���  $ Search=� 24&   System.Windows.Controls.DataGrid  -     Name$ dgProveedores��   
IsReadOnly$
 true��   SelectionMode$ Single=�$   HorizontalScrollBarVisibility$
 Auto=�   AutoGenerateColumns$ False��$��2��$��Center=�$��Center=�$��1��$��5,5,5,5q�   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$	 CIF��1  +System.Windows.Controls.DataGridBoundColumn   Binding �� $	 CIF�  $ Nombre�� �� $ NombreCompleto�  $ Correo�� �� $ Correo�  $ 	Teléfono�� �� $ Telefono�  $ 	Direccion�� �� $ 	Direccion�4  .System.Windows.Controls.DataGridTemplateColumn      Width5  /System.Windows.Controls.DataGridLengthConverter$	  100 !   CellTemplate! �� .R��� ���� *Imagen+� $ 
Horizontal=�$
��Left=�$	��8,0q�$��Center=�$��3��.+��� -   $ txtBusquedaProd��$��0��$
��Left=�$	��201��#��[ $ Producto a buscar��$��Center=��� -   $	 btnBuscarProd��$��85��$��38��$
 Buscar productos provedor��$
��Left=�$	��Top=�#���  $��16(�$��0q�$��10,5,0,0q���  $ Search=� 24  -   $ dgProductos��$
 true��$
 Auto=�$��5,5,5,5q�$ False��$��2��$��Center=�$��Center=�$��4��   $	  100 ! �� .R��� ���� *Imagen+  $ Nombre�� �� $ Nombre�  $ 	Categoria�� �� $ Categoria.Nombre�  $ Stock�� �� $ Stock�  $ Precio�� �� $ Precio�  $ Marca�� �� $ Marca.Nombre�  $ Color�� �� $ Color�  $ Tamaño�� �� $ Tamaño�� $ 
Horizontal=�$
��Left=�$	��8,0q�$��Center=�$��6��.+��� -   $ txtBusquedaLi��$��0��$
��Left=�$	��201��#��[ $ Libro a buscar��$��Center=��� -   $	 btnBuscarLi��$��85��$��38��$
 Buscar libro proveedor��$
��Left=�$	��Top=�#���  $��16(�$��0q�$��10,5,0,0q���  $ Search=� 24  -   $ dgLibros��$
 true��$ Single=�$
 Auto=�$ False��$��3��$��Center=�$��Center=�$��7��$��5,5,5,5q�   $	  100 ! �� .R��� ���� *Imagen+  $ Título�� �� $ Nombre�  $
 ISBN�� �� $
 ISBN�  $ Autor�� �� $ Autor�  $
 Tipo�� �� $ Tipo.Nombre�  $ 	Editorial�� �� $ Editorial.Nombre�  $ Descripción�� �� $ Descripcion�  $ Stock�� �� $ Stock�  $ Precio�� �� $ Precio�  $ Edicion�� �� $ Edicion�� -   $ gAñadirPro_Li��$��2��$��10��$��0�� �� $��62 ��� $	��57* ��� $	��49* ��� $	��56* ��� $	��56* ��� $	��56* ��� $	��56* ��� $	��55* ��� $	��55* ��� $	��55* � �� $
��373* ��� $
��373* �.+�� $ 
Horizontal=�$
��Left=�$��Bottom=�$��0,0,0,5q�$��37��$	��185��.+��� -    $	 btnGuardarProd��$
 registar��#���  $��14(�$
 Hand��$��90��$��0,5,0,0q���  $ PenPlus=� 24�� -!   $	 btnBorrarProd��$
 eliminar��#���  $��14(�$
 Hand��$��90��$��5,5,0,0q���  $ Delete=� 24� $ 
Horizontal=�$
��Left=�$��8,0,0,2q�$��Bottom=�$��1��$��32��$	��190��.+��� -"   $	 btnGuardarLi��$
 registar��#���  $��14(�$��90��$
 Hand����  $ BookPlus=� 24�� -#   $	 btnBorrarLi��$
 eliminar��#���  $	��5,0q�$��90��$��14(�$
 Hand����  $ Delete=� 24�� -$   $ cbProductosAdd��$��6��$��1��$ Productos del proveedor��#��[ $��38��$��0,0,10,0q�" �� SelectedValue" �� $ 
ProductoId�$ TwoWay=�$ PropertyChanged=�$
 True���� -%   $ cbLibrosAdd��$��6��$��1��$��1��$ Libros del proveedor��#��[ $��38��$��0,0,10,0q�" �� $ LibroId�$ TwoWay=�$ PropertyChanged=�$
 True��� $ 
Horizontal=�$
��Left=�$��Center=�$��2��$��0��$��38��$	��301��.+��� -&   $ txtBusquedaProdAdd��$��0��$
��Left=�$	��201��#��[ $ Producto a buscar��$��Center=��� -'   $	 btnBuscarProdAdd��$��85��$��38��$
��Left=�$	��Top=�#���  $��16(�$��0q�$��15,0,0,0q���  $ Search=� 24  -(   $ dgProductosAdd��$
 true��$ Single=�$��2��$
 Auto=�$ False��$��4��$��Center=�$��Center=�$��3��$��0,7,0,56q�   $	  100 ! �� .R��� ���� *Imagen+  $ Nombre�� �� $ Nombre�  $ 	Categoria�� �� $ Categoria.Nombre�  $ Stock�� �� $ Stock�  $ Precio�� �� $ Precio�  $ Marca�� �� $ Marca.Nombre�  $ Color�� �� $ Color�  $ Tamaño�� �� $ Tamaño�  $ 
Prooveedor�� �� $ Prooveedor.Nombre�� $ 
Horizontal=�$
��Left=�$��6��$��0,0,0,54q�$��2��$	��301��.+��� -)   $ txtBusquedaLiAdd��$��0��$
��Left=�$	��201��#��[ $ Libro a buscar��$��Center=��� -*   $	 btnBuscarLiAdd��$��85��$��38��$
��Left=�$	��Top=�#���  $��16(�$��0q�$��15,0,0,0q���  $ Search=� 24  -+   $ dgLibrosAdd��$
 true��$ Single=�$
 Auto=�$ False��$��3��$��Center=�$��Center=�$��7��$��2��   $	  100 ! �� .R��� ���� *Imagen+  $ Título�� �� $ Nombre�  $
 ISBN�� �� $
 ISBN�  $ Autor�� �� $ Autor�  $
 Tipo�� �� $ Tipo.Nombre�  $ 	Editorial�� �� $ Editorial.Nombre�  $ Descripción�� �� $ Descripcion�  $ Stock�� �� $ Stock�  $ Precio�� �� $ Precio�  $ Edicion�� �� $ Edicion�  $ 
Prooveedor�� �� $ Prooveedor.Nombre�'	  !MaterialDesignThemes.Wpf.Snackbar	  -,   # 	 Name$# sbNotification��$	��Top=�$��Center=�$ 	  MessageQueue$ 4
  .MaterialDesignThemes.Wpf.MessageQueueExtension
  