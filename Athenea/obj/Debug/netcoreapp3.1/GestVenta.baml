   M S B A M L   `   `   `  ����B  >Athenea, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:AtheneaAthenea  5          Athenea.GestVenta   5      W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      'localclr-namespace:Athenea     5      c _MaterialDesignThemes.MahApps, Version=0.2.7.0, Culture=neutral, PublicKeyToken=df2a72020bd7962a_ [MaterialDesignThemes.Wpf, Version=4.7.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aHmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes   5	         N� Title$  Gestionar Ventas��6      MaterialDesignBody#���   5      $
��Bold"�5      $��16(�5       N� 
FontFamily$X Rpack://application:,,,/MaterialDesignThemes.Wpf;component/Resources/Roboto/#Roboto)�5      .��5      � $��1��6   
�������$
{�True��63   $y�Visible=�6D   .+�5   
   � -   5         �Name$ gContenidoPap��5      
�������$
{�True��6?   $y�Visible=�6P   $��Stretch=�6e    � RowDefinitions 5      �� 5      $��60 �6    �� 5      $	��67* �6    �� 5      $��56 �6    �� 5      $��39 �6    �� 5      $	��48* �6    �� 5      $
��100* �6    �� 5      $	��65* �6    �� 5      $	��65* �6     � ColumnDefinitions 5      �� 5      $	��97* �6#   �� 5       $	��63* �6#   .+�5#      �  � Orientation$ 
Horizontal=�6   $
��Left=�61   $��Center=�6L   $��5,0,0,0q�6g   $��0��6x   $��4��6�   .+�5%      �� -   5         ��Name$ txtBusquedaLi��5%   �   $��0��6   $
��Left=�6'   $	��201��6B    % !MaterialDesignFloatingHintTextBox#��[ 6N   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Libro a buscar��6�   $��Center=�6�   �� 5&      -   5         ��Name$ btnBuscarLibros��5&      $��85��62   $��38��6=   	 � ToolTip$	 Buscar libro��6I   $
��Left=�6`   $	��Top=�6{    " MaterialDesignFlatDarkBgButton#���  6�   $��0q�6  $��10,5,0,0q�6  
 � Cursor$

 Hand��6A  ��6�   0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$ Search=�   Size 256A  5(      � 5*      $ 
Horizontal=�6   $
��Left=�61   $��Bottom=�6L   $��5,0,0,5q�6g   $��43��6x   .+�5,      �� -   5        $ txtBusquedaPap��5,   �   $��0��6   $
��Left=�6'   $	��201��6B   #��[ 6N   $ Producto a buscar��6�   $��Center=�6�   �� 5-      -   5        $ btnBuscarPap��5-      $��85��6/   $��38��6:   $	 Buscar Libro��6F   $
��Left=�6]   $	��Top=�6x   #���  6�   $��0q�6  $��10,5,0,0q�6  $

 Hand��6A  ��6�     $ Search=� 256A  5/      � 51      $ 
Horizontal=�6   $��Right=�61   $��Bottom=�6M   $��0,0,5,5q�6h   $��43��6y   .+�53      �� -   5        $ btnMostrarVentas��53      $��75��63   $��38��6>   $	 Mostrar Ventas��6J   $
��Left=�6c   $	��Top=�6~   #���  6�   $��0q�6	  $��10,5,0,0q�6  $

 Hand��6F  ��6�     $ ListBox=� 256F  55      &   System.Windows.Controls.DataGrid  57      -   5          Name$ dgLibros��57         
IsReadOnly$
 true��6)      SelectionMode$ Single=�6;   $��0,5,5,5q�6R      AutoGenerateColumns$ False��6c   $��3��6   $��5��6�   $��Center=�6�   $��Center=�6�      Columns 58      4  .System.Windows.Controls.DataGridTemplateColumn  5:      ,  &System.Windows.Controls.DataGridColumn   Width5  /System.Windows.Controls.DataGridLengthConverter$	 100 6-      CellTemplate 5;      �� 5<      .R�5=   "   �� ��6(   �� *Imagen+5>      5@      0  *System.Windows.Controls.DataGridTextColumn  5A         Header$ Título��6)   1  +System.Windows.Controls.DataGridBoundColumn   Binding 69   ��  �� Path$ Nombre�  5B      $
 ISBN��6)    67   �� $
 ISBN�  5C      $ Autor��6)    68   �� $ Autor�  5D      $
 Tipo��6)    67   �� $ Tipo.Nombre�  5E      $ 	Editorial��6)    6<   �� $ Editorial.Nombre�  5F      $ Descripción��6)    6>   �� $ Descripcion�  5G      $ Stock��6)    68   �� $ Stock�  5H      $ Precio��6)    69   �� $ Precio�  5I      $ Edicion��6)    6:   �� $ Edicion�  5J      $ 
Prooveedor��6)    6=   �� $ Proveedor.Nombre�5M        5O      -   5        $ dgPapeleria��5O      $
 true��6,   $ Single=�6>   $��0,5,5,5q�6U   $   HorizontalScrollBarVisibility$
 Auto=�6f   $ False��6�   $��3��6�   $��Center=�6�   $��Center=�6�   $��1��6�    5P        5R      $ 70 6-    5S      �� 5T      .R�5U   "   �� ��6(   �� *Imagen+5V      5X        5Y      $ Nombre��6)    69   �� $ Nombre�  5Z      $ 	Categoria��6)    6<   �� $ Categoria.Nombre�  5[      $ Stock��6)    68   �� $ Stock�  5\      $ Precio��6)    69   �� $ Precio�  5]      $ Marca��6)    68   �� $ Marca.Nombre�  5^      $ Color��6)    68   �� $ Color�  5_      $ Tamaño��6)    69   �� $ Tamaño�  5`      $ 
Prooveedor��6)    6=   �� $ Proveedor.Nombre�5c      �� 5e      -	   5         ��Name$ gbFormularioProducto��5e      $&�� Datos para la venta del producto��65     MaterialDesignGroupBox#���  6_   $��0��6�   $��3��6�   $��1��6�   $��5,10,5,5q�6�   .��5g      � -
   5        $ gContenedorProducto��5g      $

 Hand��64    5i      �� 5j      $��* �6(   �� 5k      $��* �6(    5n      �� 5o      $��* �6+   �� 5p      $��* �6+   .+�5s      �� -   5         ��Name$ Imagen��5s      $��0��6,   $��0��6<   $��3��6I   $ Imagen��6Z   $

 Hand��5v   6   ��5s   �   �� $ Imagen� �� Mode$ TwoWay=� �� NotifyOnValidationError$
 True�� �� UpdateSourceTrigger$ PropertyChanged=� �� ValidatesOnDataErrors$
 True��5v   6   �� 5x      -   5        $ 	txtNombre��5x   �   $��0��6   $��1��6+   $��0��6;   $ Nombre��6H   #��[ 6p   $��Center=�6�   $
��10,0q�6�   ��6�   �� $ Nombre�$ TwoWay=�$ PropertyChanged=�$
 True��$
 True���� 5}      -   5        $ txtCantidad��5}   �   $��1��6   $��1��6+   $��1��6;   $ Cantidad��6H   #��[ 6r   $��Center=�6�   $��	10,0,10,0q�6�   6�   5~      5      � 5�      $ 
Horizontal=�6   $
��Left=�61   $��Bottom=�6L   $��1��6g   $��2��6w   $��5,0,0,0q�6�   $��47��6�   $	��180��6�   $��2��6�   .+�5�      �� -   5        $ 
btnAñadir��5�      $	 añadir producto��6l   #���  6�   $��14(�6�   $��85��6�   $��0,5,0,0q�6�   ��6,     $ CartArrowDown=� 236�   �� 5�      -   5        $ 	btnBorrar��5�      $	 quitar producto��6i   #���  6�   $��5,10,5,5q�6�   $��85��6�   $��14(�6�   $

 Hand��6   ��6,     $ 
CartRemove=� 236   5�      � 5�      $ 
Horizontal=�6   $��Right=�61   $��Center=�6M   $��1��6h   $��3��6x   $��0,0,5,0q�6�   $��32��6�   $��85��6�   .+�5�      �� -   5        $ btnVenta��5�      $��Right=�6+   $	 hacer venta��6�   #���  6�   $��14(�6�   $��85��6�   $

 Hand��6  ��6G     $ CartArrowRight=� 236  5�        5�      -   5        $ lbListaVenta��5�      $
 true��6-   $ Single=�6?   $��5,5,5,5q�6V   $ False��6g   $��4��6�   $��4��6�   $��1��6�   $��Center=�6�   $��Center=�6�    5�        5�      $ Producto��6)    6;   �� $ Producto.Nombre�  5�      $ Importe��6)    6:   �� $ Importe� �� StringFormat$ N3��  5�      $ Cantidad��6)    6;   �� $ Cantidad�5�      '	  !MaterialDesignThemes.Wpf.Snackbar	  5�      -   5         	 Name$ sbNotification��5�   &   $	��Top=�5�      $��Center=�6)     	  MessageQueue  5�      4
  .MaterialDesignThemes.Wpf.MessageQueueExtension
  5�      5�      5�      