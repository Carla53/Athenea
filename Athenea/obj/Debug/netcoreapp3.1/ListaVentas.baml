   M S B A M L   `   `   `  ����B  >Athenea, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:AtheneaAthenea  5          Athenea.ListaVentas   5      W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      'localclr-namespace:Athenea     5      c _MaterialDesignThemes.MahApps, Version=0.2.7.0, Culture=neutral, PublicKeyToken=df2a72020bd7962a_ [MaterialDesignThemes.Wpf, Version=4.7.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aHmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes   5        N� Title$)  #Gestionar de la lista de las ventas��5	         MaterialDesignBody#���   5      $
��Bold"�5      $��16(�5       N� 
FontFamily$X Rpack://application:,,,/MaterialDesignThemes.Wpf;component/Resources/Roboto/#Roboto)�5      .��5      � .+�5   
   � -   5         �Name$ gContenidoUs��5      
�������$
{�True��6>   $y�Visible=�6O    � RowDefinitions 5      �� 5      $��55 �6    �� 5      $
��123* �6    �� 5      $
��127* �6     � ColumnDefinitions 5      �� 5      $
��367* �6#   �� 5      $
��913* �6#   .+�5      �  � Orientation$ 
Horizontal=�6   $
��Left=�61   $��Bottom=�6L   $��47��6g   $	��392��6s   $��2��6   .+�5       �� -   5         ��Name$ btnAtras��5        � ToolTip$ Ir a Ventas��6g    " MaterialDesignFlatDarkBgButton#���  6}   $��12,5,0,0q�6�   $��90��6�   $��14(�6�    � Cursor$
 Hand��6�   ��6+   0  *MaterialDesignThemes.Wpf.PackIconExtension  	   Kind$	 	ArrowLeft=�
   Size
 246�   �� 5!      -   5        $ btnNuevo��5!      $ limpiar formulario��6c   #���  6�   $��14(�6�   $
 Hand��6�   $��90��6�   $��5,5,0,0q�6�   ��6+     $	 Clear=�
 246�   �� 5"      -   5        $ 	btnBorrar��5"      $ eliminar��6e   #���  6x   $��5,5,0,0q�6�   $��90��6�   $��14(�6�   $
 Hand��6�   ��6,     $	 Delete=�
 246�   5$      � 5&      $ 
Horizontal=�6   $
��Left=�61   $��	15,0,0,10q�6L   $��Bottom=�6_   $��1��6z   $��43��6�   $	��296��6�   .+�5(      �� -   5         ��Name$ txtBusquedaVenta��5(   �   $��0��6   $
��Left=�6'   $	��201��6B    % !MaterialDesignFloatingHintTextBox#��[ 6N   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Valor a buscar��6�   $��Center=�6�   �� 5)      -   5        $ 	btnBuscar��5)      $��85��6,   $��38��67   $ Buscar Libro��6C   $
��Left=�6Z   $	��Top=�6u   #���  6�   $��16(�6�   $��0q�6  $��10,5,0,0q�6  $
 Hand��6C  ��6�     $	 Search=�
 246C  5+      �� 5-      -   5         ��Name$ gbFormulario��5-      $��Datos de Venta��6-     MaterialDesignGroupBox#���  6E   $��1��6v   $��2��6�   $��
10,2,10,10q�6�   .��5/      � -   5        $ gContenedor5a��5/      $
 Hand��6.    51      �� 52      $��* �6(   �� 53      $��* �6(   �� 54      $��* �6(   �� 55      $��* �6(   �� 56      $��* �6(   �� 57      $��* �6(    5:      �� 5;      $��* �6+   .+�5>      �� -	   5        $ txtId��5>   �   $��0��6   $��0��6+   $��0��68   $ Id��6H   #��[ 6l   $��Center=�6�   $
��10,0q�6�   ��6�   ��  �� Path$ VentaId� �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=� �� NotifyOnValidationError$
 True�� �� ValidatesOnDataErrors$
 True���� 5C      -
   5        $ txtFecha��5C   �   $��1��6   $��0��6+   $��1��6;   $ Fecha��6H   #��[ 6o   $��Center=�6�   $
��10,0q�6�   ��6�   �� $ Fecha�$ TwoWay=�$ PropertyChanged=�$
 True��$
 True�� �� StringFormat$ 
yyyy/MM/dd���� 5J      -   5        $ 
txtImporte��5J   �   $��2��6   $��0��6+   $��2��6;   $ Importe��6H   #��[ 6q   $��Center=�6�   $��	10,0,10,0q�6�   ��6�   �� $ Importe�$ OneWay=�$
 True��$ N2��$
 True���� 5O      -   5         ��Name$ cbProductos��5O   �   $��3��6   $��0��6,   $��3��6<   $ 	Productos��6I    & "MaterialDesignFloatingHintComboBox#��[ 6t   $��Center=�6�   $��	10,0,10,0q�6�    �� SelectedValue 6�   �� $ 
ProductoId�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� 5T      -   5        $ cbLibros��5T   q   $��4��6   $��0��6,   $��4��6<   $ Libros��6I   #��[ 6�   $��Center=�6�   $
��10,0q�6�   $��38��6�    6�   �� $ LibroId�$ TwoWay=�$ PropertyChanged=�$
 True��$
 True���� 5Z      -   5        $ 
txtUsuario��5Z   �   $��5��6   $��0��6+   $��5��6;   $ Usuario��6H   #��[ 6q   $��Center=�6�   $
��10,0q�6�   ��6�   �� $ Usuario.Nombre�$ TwoWay=�$ PropertyChanged=�$
 True��$
 True��5^      5_      &   System.Windows.Controls.DataGrid  5a      -   5          Name$ dgVentas��5a      $��0,5,5,5q�6)      
IsReadOnly$
 true��6:      SelectionMode$ Single=�6L   $   HorizontalScrollBarVisibility$
 Auto=�6c      AutoGenerateColumns$ False��6�   $��1��6�   $��1��6�      Columns 5b      0  *System.Windows.Controls.DataGridTextColumn  5d      ,  &System.Windows.Controls.DataGridColumn   Header$ Id��6)   1  +System.Windows.Controls.DataGridBoundColumn   Binding 65   �� $ VentaId�  5e      $ Importe��6)    6:   �� $ Importe�$ N3��  5f      $ Fecha��6)    68   �� $ Fecha�$ 
yyyy/MM/dd��  5g      $ Usuario��6)    6:   �� $ Usuario.Nombre�5j        5l      -   5        $ dgLineasVenta��5l      $��0,5,5,5q�6.   $
 true��6?   $ Single=�6Q   $
 Auto=�6h   $ False��6�   $��2��6�   $��1��6�    5m        5o      $ Nombre del producto��6)    6F   �� $ Producto.Nombre�  5p      $ Precio��6)    69   �� $ Precio�$ N3��  5q      $ Cantidad��6)    6;   �� $ Cantidad�  5r      $ Importe��6)    6:   �� $ Importe�$ N3��5u      '  !MaterialDesignThemes.Wpf.Snackbar  5w      -   5          Name$ sbNotification��5w   &   $	��Top=�5x      $��0��5y   >   $	��288��6I      MessageQueue 6   4  .MaterialDesignThemes.Wpf.MessageQueueExtension  6I   5z      5{      5|      