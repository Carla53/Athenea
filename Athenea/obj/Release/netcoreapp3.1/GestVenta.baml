   M S B A M L   `   `   `  ���� B  >Athenea, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:AtheneaAthenea      Athenea.GestVenta   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     'localclr-namespace:Athenea     c _MaterialDesignThemes.MahApps, Version=0.2.7.0, Culture=neutral, PublicKeyToken=df2a72020bd7962a_ [MaterialDesignThemes.Wpf, Version=4.7.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aHmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes     N� Title$  Gestionar Ventas��   MaterialDesignBody#���   $
��Bold"�$��16(� N� 
FontFamily$X Rpack://application:,,,/MaterialDesignThemes.Wpf;component/Resources/Roboto/#Roboto)�.��� $��1��
�������$
{�True��$y�Visible=�.+�� -    �Name$ gContenidoPap��
�������$
{�True��$y�Visible=�$��Stretch=� � RowDefinitions �� $��60 ��� $	��67* ��� $��56 ��� $��39 ��� $	��48* ��� $
��100* ��� $	��65* ��� $	��65* � � ColumnDefinitions �� $	��97* ��� $	��63* �.+��  � Orientation$ 
Horizontal=�$
��Left=�$��Center=�$��5,0,0,0q�$��0��$��4��.+��� -    ��Name$ txtBusquedaLi��$��0��$
��Left=�$	��201�� % !MaterialDesignFloatingHintTextBox#��[ )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Libro a buscar��$��Center=��� -    ��Name$ btnBuscarLibros��$��85��$��38��	 � ToolTip$	 Buscar libro��$
��Left=�$	��Top=� " MaterialDesignFlatDarkBgButton#���  $��0q�$��10,5,0,0q�
 � Cursor$

 Hand����0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$ Search=�   Size 25� $ 
Horizontal=�$
��Left=�$��Bottom=�$��5,0,0,5q�$��43��.+��� -   $ txtBusquedaPap��$��0��$
��Left=�$	��201��#��[ $ Producto a buscar��$��Center=��� -   $ btnBuscarPap��$��85��$��38��$	 Buscar Libro��$
��Left=�$	��Top=�#���  $��0q�$��10,5,0,0q�$

 Hand����  $ Search=� 25� $ 
Horizontal=�$��Right=�$��Bottom=�$��0,0,5,5q�$��43��.+��� -   $ btnMostrarVentas��$��75��$��38��$	 Mostrar Ventas��$
��Left=�$	��Top=�#���  $��0q�$��10,5,0,0q�$

 Hand����  $ ListBox=� 25&   System.Windows.Controls.DataGrid  -     Name$ dgLibros��   
IsReadOnly$
 true��   SelectionMode$ Single=�$��0,5,5,5q�   AutoGenerateColumns$ False��$��3��$��5��$��Center=�$��Center=�   Columns 4  .System.Windows.Controls.DataGridTemplateColumn  ,  &System.Windows.Controls.DataGridColumn   Width5  /System.Windows.Controls.DataGridLengthConverter$	 100    CellTemplate �� .R��� ���� *Imagen+0  *System.Windows.Controls.DataGridTextColumn     Header$ Título��1  +System.Windows.Controls.DataGridBoundColumn   Binding ��  �� Path$ Nombre�  $
 ISBN�� �� $
 ISBN�  $ Autor�� �� $ Autor�  $
 Tipo�� �� $ Tipo.Nombre�  $ 	Editorial�� �� $ Editorial.Nombre�  $ Descripción�� �� $ Descripcion�  $ Stock�� �� $ Stock�  $ Precio�� �� $ Precio�  $ Edicion�� �� $ Edicion�  $ 
Prooveedor�� �� $ Proveedor.Nombre�  -   $ dgPapeleria��$
 true��$ Single=�$��0,5,5,5q�$   HorizontalScrollBarVisibility$
 Auto=�$ False��$��3��$��Center=�$��Center=�$��1��   $ 70  �� .R��� ���� *Imagen+  $ Nombre�� �� $ Nombre�  $ 	Categoria�� �� $ Categoria.Nombre�  $ Stock�� �� $ Stock�  $ Precio�� �� $ Precio�  $ Marca�� �� $ Marca.Nombre�  $ Color�� �� $ Color�  $ Tamaño�� �� $ Tamaño�  $ 
Prooveedor�� �� $ Proveedor.Nombre��� -	    ��Name$ gbFormularioProducto��$&�� Datos para la venta del producto��  MaterialDesignGroupBox#���  $��0��$��3��$��1��$��5,10,5,5q�.��� -
   $ gContenedorProducto��$

 Hand�� �� $��* ��� $��* � �� $��* ��� $��* �.+��� -    ��Name$ Imagen��$��0��$��0��$��3��$ Imagen��$

 Hand������ $ Imagen� �� Mode$ TwoWay=� �� NotifyOnValidationError$
 True�� �� UpdateSourceTrigger$ PropertyChanged=� �� ValidatesOnDataErrors$
 True���� -   $ 	txtNombre��$��0��$��1��$��0��$ Nombre��#��[ $��Center=�$
��10,0q����� $ Nombre�$ TwoWay=�$ PropertyChanged=�$
 True��$
 True���� -   $ txtCantidad��$��1��$��1��$��1��$ Cantidad��#��[ $��Center=�$��	10,0,10,0q�� $ 
Horizontal=�$
��Left=�$��Bottom=�$��1��$��2��$��5,0,0,0q�$��47��$	��180��$��2��.+��� -   $ 
btnAñadir��$	 añadir producto��#���  $��14(�$��85��$��0,5,0,0q���  $ CartArrowDown=� 23�� -   $ 	btnBorrar��$	 quitar producto��#���  $��5,10,5,5q�$��85��$��14(�$

 Hand����  $ 
CartRemove=� 23� $ 
Horizontal=�$��Right=�$��Center=�$��1��$��3��$��0,0,5,0q�$��32��$��85��.+��� -   $ btnVenta��$��Right=�$	 hacer venta��#���  $��14(�$��85��$

 Hand����  $ CartArrowRight=� 23  -   $ lbListaVenta��$
 true��$ Single=�$��5,5,5,5q�$ False��$��4��$��4��$��1��$��Center=�$��Center=�   $ Producto�� �� $ Producto.Nombre�  $ Importe�� �� $ Importe� �� StringFormat$ N3��  $ Cantidad�� �� $ Cantidad�'	  !MaterialDesignThemes.Wpf.Snackbar	  -    	 Name$ sbNotification��$	��Top=�$��Center=�  	  MessageQueue  4
  .MaterialDesignThemes.Wpf.MessageQueueExtension
  