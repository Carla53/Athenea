   M S B A M L   `   `   `  ���� B  >Athenea, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:AtheneaAthenea      Athenea.ListaVentas   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     'localclr-namespace:Athenea     c _MaterialDesignThemes.MahApps, Version=0.2.7.0, Culture=neutral, PublicKeyToken=df2a72020bd7962a_ [MaterialDesignThemes.Wpf, Version=4.7.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aHmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes     N� Title$)  #Gestionar de la lista de las ventas��   MaterialDesignBody#���   $
��Bold"�$��16(� N� 
FontFamily$X Rpack://application:,,,/MaterialDesignThemes.Wpf;component/Resources/Roboto/#Roboto)�.��� .+�� -    �Name$ gContenidoUs��
�������$
{�True��$y�Visible=� � RowDefinitions �� $��55 ��� $
��123* ��� $
��127* � � ColumnDefinitions �� $
��367* ��� $
��913* �.+��  � Orientation$ 
Horizontal=�$
��Left=�$��Bottom=�$��47��$	��392��$��2��.+��� -    ��Name$ btnAtras�� � ToolTip$ Ir a Ventas�� " MaterialDesignFlatDarkBgButton#���  $��12,5,0,0q�$��90��$��14(� � Cursor$
 Hand����0  *MaterialDesignThemes.Wpf.PackIconExtension  	   Kind$	 	ArrowLeft=�
   Size
 24�� -   $ btnNuevo��$ limpiar formulario��#���  $��14(�$
 Hand��$��90��$��5,5,0,0q���  $	 Clear=�
 24�� -   $ 	btnBorrar��$ eliminar��#���  $��5,5,0,0q�$��90��$��14(�$
 Hand����  $	 Delete=�
 24� $ 
Horizontal=�$
��Left=�$��	15,0,0,10q�$��Bottom=�$��1��$��43��$	��296��.+��� -    ��Name$ txtBusquedaVenta��$��0��$
��Left=�$	��201�� % !MaterialDesignFloatingHintTextBox#��[ )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Valor a buscar��$��Center=��� -   $ 	btnBuscar��$��85��$��38��$ Buscar Libro��$
��Left=�$	��Top=�#���  $��16(�$��0q�$��10,5,0,0q�$
 Hand����  $	 Search=�
 24�� -    ��Name$ gbFormulario��$��Datos de Venta��  MaterialDesignGroupBox#���  $��1��$��2��$��
10,2,10,10q�.��� -   $ gContenedor5a��$
 Hand�� �� $��* ��� $��* ��� $��* ��� $��* ��� $��* ��� $��* � �� $��* �.+��� -	   $ txtId��$��0��$��0��$��0��$ Id��#��[ $��Center=�$
��10,0q�����  �� Path$ VentaId� �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=� �� NotifyOnValidationError$
 True�� �� ValidatesOnDataErrors$
 True���� -
   $ txtFecha��$��1��$��0��$��1��$ Fecha��#��[ $��Center=�$
��10,0q����� $ Fecha�$ TwoWay=�$ PropertyChanged=�$
 True��$
 True�� �� StringFormat$ 
yyyy/MM/dd���� -   $ 
txtImporte��$��2��$��0��$��2��$ Importe��#��[ $��Center=�$��	10,0,10,0q����� $ Importe�$ OneWay=�$
 True��$ N2��$
 True���� -    ��Name$ cbProductos��$��3��$��0��$��3��$ 	Productos�� & "MaterialDesignFloatingHintComboBox#��[ $��Center=�$��	10,0,10,0q� �� SelectedValue �� $ 
ProductoId�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� -   $ cbLibros��$��4��$��0��$��4��$ Libros��#��[ $��Center=�$
��10,0q�$��38�� �� $ LibroId�$ TwoWay=�$ PropertyChanged=�$
 True��$
 True���� -   $ 
txtUsuario��$��5��$��0��$��5��$ Usuario��#��[ $��Center=�$
��10,0q����� $ Usuario.Nombre�$ TwoWay=�$ PropertyChanged=�$
 True��$
 True��&   System.Windows.Controls.DataGrid  -     Name$ dgVentas��$��0,5,5,5q�   
IsReadOnly$
 true��   SelectionMode$ Single=�$   HorizontalScrollBarVisibility$
 Auto=�   AutoGenerateColumns$ False��$��1��$��1��   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ Id��1  +System.Windows.Controls.DataGridBoundColumn   Binding �� $ VentaId�  $ Importe�� �� $ Importe�$ N3��  $ Fecha�� �� $ Fecha�$ 
yyyy/MM/dd��  $ Usuario�� �� $ Usuario.Nombre�  -   $ dgLineasVenta��$��0,5,5,5q�$
 true��$ Single=�$
 Auto=�$ False��$��2��$��1��   $ Nombre del producto�� �� $ Producto.Nombre�  $ Precio�� �� $ Precio�$ N3��  $ Cantidad�� �� $ Cantidad�  $ Importe�� �� $ Importe�$ N3��'  !MaterialDesignThemes.Wpf.Snackbar  -     Name$ sbNotification��$	��Top=�$��0��$	��288��   MessageQueue 4  .MaterialDesignThemes.Wpf.MessageQueueExtension  