   M S B A M L   `   `   `  ����B  >Athenea, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:AtheneaAthenea  5          Athenea.ListaCompra   5      W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      'localclr-namespace:Athenea     5      c _MaterialDesignThemes.MahApps, Version=0.2.7.0, Culture=neutral, PublicKeyToken=df2a72020bd7962a_ [MaterialDesignThemes.Wpf, Version=4.7.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aHmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes   5        N� Title$*  $Gestionar de las listas de la compra��5	         MaterialDesignBody#���   5      $
��Bold"�5      $��16(�5       N� 
FontFamily$X Rpack://application:,,,/MaterialDesignThemes.Wpf;component/Resources/Roboto/#Roboto)�5      .��5      � .+�5   
   � -   5         �Name$ gContenidoUs��5      
�������$
{�True��6>   $y�Visible=�6O    � RowDefinitions 5      �� 5      $��55 �6    �� 5      $
��123* �6    �� 5      $
��110* �6    �� 5      $	��17* �6     � ColumnDefinitions 5      �� 5      $	��29* �6#   �� 5      $	��51* �6#   .+�5      �  � Orientation$ 
Horizontal=�6   $
��Left=�61   $��Bottom=�6L   $��47��6g   $	��392��6s   .+�5!      �� -   5         ��Name$ btnAtras��5!       � ToolTip$ ir a Compras��6g    " MaterialDesignFlatDarkBgButton#���  6~   $��5,5,0,0q�6�   $��90��6�   $��14(�6�    � Cursor$
 Hand��6�   ��6+   0  *MaterialDesignThemes.Wpf.PackIconExtension  	   Kind$	 	ArrowLeft=�
   Size
 246�   �� 5"      -   5        $ btnNuevo��5"      $ limpiar formulario��6c   #���  6�   $��14(�6�   $
 Hand��6�   $��90��6�   $��5,5,0,0q�6�   ��6+     $	 Clear=�
 246�   �� 5#      -   5        $ 	btnBorrar��5#      $ eliminar��6e   #���  6x   $��5,5,0,0q�6�   $��90��6�   $��14(�6�   $
 Hand��6�   ��6,     $	 Delete=�
 246�   5%      � 5'      $ 
Horizontal=�6   $
��Left=�61   $��2,0,0,10q�6L   $��Bottom=�6^   $��1��6y   $��43��6�   .+�5)      �� -   5         ��Name$ txtBusquedaVent��5)   �   $��0��6   $
��Left=�6'   $	��201��6B    % !MaterialDesignFloatingHintTextBox#��[ 6N   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Valor a buscar��6�   $��Center=�6�   �� 5*      -   5        $ 	btnBuscar��5*      $��85��6,   $��38��67   $ Buscar Libro��6C   $
��Left=�6Z   $	��Top=�6u   #���  6�   $��16(�6�   $��0q�6  $��5,5,0,0q�6  $
 Hand��6B  ��6�     $	 Search=�
 246B  5,      �� 5.      -   5         ��Name$ gbFormulario��5.      $��Datos de Venta��6-     MaterialDesignGroupBox#���  6E   $��1��6v   $��3��6�   $��5,2,5,5q�6�   .��50      � -   5        $ gContenedor5a��50      $
 Hand��6.    52      �� 53      $��* �6(   �� 54      $��* �6(   �� 55      $��* �6(   �� 56      $��* �6(    59      �� 5:      $��* �6+   �� 5;      $��* �6+   .+�5>      �� -	   5        $ txtId��5>   �   $��0��6   $��0��6+   $��0��68   $ Id��6H   #��[ 6l   $��Center=�6�   $
��10,0q�6�   ��6�   ��  �� Path$ CompraId� �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=� �� NotifyOnValidationError$
 True�� �� ValidatesOnDataErrors$
 True���� 5C      -
   5        $ txtFecha��5C   �   $��1��6   $��0��6+   $��3��6;   $ Fecha��6H   #��[ 6o   $��Center=�6�   $
��10,0q�6�   ��6�   �� $ Fecha�$ TwoWay=�$ PropertyChanged=�$
 True��$
 True�� �� StringFormat$ 
yyyy/MM/dd���� 5I      -   5        $ 
txtImporte��5I   �   $��2��6   $��0��6+   $��2��6;   $ Importe��6H   #��[ 6q   $��Center=�6�   $��	10,0,10,0q�6�   ��6�   �� $ Importe�$ OneWay=�$
 True��$ N2��$
 True���� 5N      -   5         ��Name$ cbProductos��5N   �   $��3��6   $��0��6,   $��1��6<   $ 	Productos��6I    & "MaterialDesignFloatingHintComboBox#��[ 6t   $��Center=�6�   $��	10,0,10,0q�6�    �� SelectedValue 6�   �� $ 
ProductoId�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� 5S      -   5        $ cbLibros��5S   q   $��4��6   $��1��6,   $��1��6<   $ Libros��6I   #��[ 6�   $��Center=�6�   $
��10,0q�6�   $��38��6�    6�   �� $ LibroId�$ TwoWay=�$ PropertyChanged=�$
 True���� 5X      -   5        $ 
txtUsuario��5X   �   $��5��6   $��1��6+   $��0��6;   $ Usuario��6H   #��[ 6q   $��Center=�6�   $
��10,0q�6�   ��6�   �� $ Usuario.Nombre�$ TwoWay=�$ PropertyChanged=�$
 True��$
 True���� 5]      -   5        $ txtProveedor��5]   �   $��6��6   $��1��6+   $��2��6;   $ 	Proveedor��6H   #��[ 6s   $��Center=�6�   $��	10,0,10,0q�6�   ��6�   �� $ Proveedor.Nombre�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True��5a      5b      &   System.Windows.Controls.DataGrid  5d      -   5          Name$ 	dgCompras��5d      $��0,5,5,5q�6*      
IsReadOnly$
 true��6;      SelectionMode$ Single=�6M   $   HorizontalScrollBarVisibility$
 Auto=�6d      AutoGenerateColumns$ False��6�   $��1��6�   $��1��6�      Columns 5e      0  *System.Windows.Controls.DataGridTextColumn  5g      ,  &System.Windows.Controls.DataGridColumn   Header$ Id��6)   1  +System.Windows.Controls.DataGridBoundColumn   Binding 65   �� $ CompraId�  5h      $ Importe��6)    6:   �� $ Importe�$ N3��  5i      $ Fecha��6)    68   �� $ Fecha�$ 
yyyy/MM/dd��  5j      $ Usuario��6)    6:   �� $ Usuario.Nombre�  5k      $ 	Proveedor��6)    6<   �� $ Proveedor.Nombre�5n        5p      -   5        $ dgLineasCompra��5p      $
 true��6/   $ Single=�6A   $
 Auto=�6X   $ False��6}   $��2��6�   $��1��6�   $��2��6�   $��0,5,5,5q�6�    5q        5s      $ Nombre del producto��6)    6F   �� $ Producto.Nombre�  5t      $ Precio��6)    69   �� $ Precio�$ N3��  5u      $ Cantidad��6)    6;   �� $ Cantidad�  5v      $ Importe��6)    6:   �� $ Importe�$ N3��5y      '  !MaterialDesignThemes.Wpf.Snackbar  5{      -   5          Name$ sbNotification��5{   &   $	��Top=�5|      $��0��5}   >   $	��288��6I      MessageQueue 6   4  .MaterialDesignThemes.Wpf.MessageQueueExtension  6I   5~      5      5�      