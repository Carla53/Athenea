   M S B A M L   `   `   `  ����B  >Athenea, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:AtheneaAthenea  5          Athenea.GestCompra   5      W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      'localclr-namespace:Athenea     5      c _MaterialDesignThemes.MahApps, Version=0.2.7.0, Culture=neutral, PublicKeyToken=df2a72020bd7962a_ [MaterialDesignThemes.Wpf, Version=4.7.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aHmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes   5	         N� Title$  Gestionar Ventas��6      MaterialDesignBody#���   5      $
��Bold"�5      $��16(�5       N� 
FontFamily$X Rpack://application:,,,/MaterialDesignThemes.Wpf;component/Resources/Roboto/#Roboto)�5      .��5      � -   5         �Name$ GestionPapeleria��5      $��1��6%   
�������$
{�True��6M   $y�Visible=�6^   .+�5   
   � -   5        $ gContenidoPap��5      
�������$
{�True��6?   $y�Visible=�6P   $��Stretch=�6e    � RowDefinitions 5      �� 5      $��60 �6    �� 5      $	��53* �6    �� 5      $	��68* �6    �� 5      $��46.402 �6    �� 5      $	��53* �6    �� 5      $	��53* �6    �� 5      $��60 �6    �� 5      $	��53* �6    �� 5      $	��53* �6     � ColumnDefinitions 5      �� 5       $	��97* �6#   �� 5!      $	��63* �6#   .+�5$      �  � Orientation$ 
Horizontal=�6   $
��Left=�61   $��Bottom=�6L   $��5,0,0,5q�6g   $��0��6x   $��2��6�   $	��301��6�   $��43��6�   $��2��6�   .+�5&      �� -   5         ��Name$ txtBusquedaPap��5&   �   $��0��6   $
��Left=�6'   $	��201��6B    % !MaterialDesignFloatingHintTextBox#��[ 6N   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Producto a buscar��6�   $��Center=�6�   �� 5'      -   5         ��Name$ btnBuscarPap��5'      	 � ToolTip$	 Buscar producto��6/   $��85��6I   $��38��6T   $
��Left=�6`   $	��Top=�6{    " MaterialDesignFlatDarkBgButton#���  6�   $��0q�6  $��10,5,0,0q�6  
 � Cursor$

 Hand��6D  ��6�   0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$ Search=�   Size 256D  5)      � 5+      $ 
Horizontal=�6   $
��Left=�61   $��Bottom=�6L   $��5,0,0,5q�6g   $��0��6x   $	��301��6�   $��43��6�   .+�5-      �� -   5        $ txtBusquedaLi��5-   �   $��0��6   $
��Left=�6'   $	��201��6B   #��[ 6N   $ Libro a buscar��6�   $��Center=�6�   �� 5.      -   5        $ btnBuscarLibros��5.      $��85��62   $��38��6=   $
��Left=�6I   $	��Top=�6d   #���  6|   $��0q�6�   $��10,5,0,0q�6�   $

 Hand��6*  ��6�     $ Search=� 256*  50      &   System.Windows.Controls.DataGrid  52      -   5          Name$ dgPapeleria��52         
IsReadOnly$
 true��6,      SelectionMode$ Single=�6>   $��0,5,0,5q�6U      AutoGenerateColumns$ False��6f   $��2��6�   $��4��6�   $��Center=�6�   $��Center=�6�      Columns 53      4  .System.Windows.Controls.DataGridTemplateColumn  55      ,  &System.Windows.Controls.DataGridColumn   Width5  /System.Windows.Controls.DataGridLengthConverter$ 70 6-      CellTemplate 56      �� 57      .R�58   "   �� ��6(   �� *Imagen+59      5;      0  *System.Windows.Controls.DataGridTextColumn  5<         Header$ Nombre��6)   1  +System.Windows.Controls.DataGridBoundColumn   Binding 69   ��  �� Path$ Nombre�  5=      $ 	Categoria��6)    6<   �� $ Categoria.Nombre�  5>      $ Stock��6)    68   �� $ Stock�  5?      $ Precio��6)    69   �� $ Precio�  5@      $ Marca��6)    68   �� $ Marca.Nombre�  5A      $ Color��6)    68   �� $ Color�  5B      $ Tamaño��6)    69   �� $ Tamaño�  5C      $ 
Prooveedor��6)    6=   �� $ Proveedor.Nombre�5F        5H      -   5        $ dgLibros��5H      $
 true��6)   $ Single=�6;   $��0,5,0,5q�6R   $   HorizontalScrollBarVisibility$
 Auto=�6c   $ False��6�   $��2��6�   $��Center=�6�   $��Center=�6�   $��1��6�    5I        5K      $ 70 6-    5L      �� 5M      .R�5N   "   �� ��6(   �� *Imagen+5O      5Q        5R      $ Título��6)    69   �� $ Nombre�  5S      $
 ISBN��6)    67   �� $
 ISBN�  5T      $ Autor��6)    68   �� $ Autor�  5U      $
 Tipo��6)    67   �� $ Tipo.Nombre�  5V      $ 	Editorial��6)    6<   �� $ Editorial.Nombre�  5W      $ Descripción��6)    6>   �� $ Descripcion�  5X      $ Stock��6)    68   �� $ Stock�  5Y      $ Precio��6)    69   �� $ Precio�  5Z      $ Edicion��6)    6:   �� $ Edicion�  5[      $ 
Prooveedor��6)    6=   �� $ Proveedor.Nombre�5^      � 5`      $ 
Horizontal=�6   $
��Left=�61   $��Bottom=�6L   $��5,0,0,5q�6g   $��0��6x   $��6��6�   $	��301��6�   $��43��6�   .+�5b      �� -	   5        $ txtBusquedaPro��5b   �   $��0��6   $
��Left=�6'   $	��201��6B   #��[ 6N   $ Proveedor a buscar��6�   $��Center=�6�   �� 5c      -
   5        $ btnBuscarProveedores��5c      $	 Buscar proveedor��67   $��85��6R   $��38��6]   $
��Left=�6i   $	��Top=�6�   #���  6�   $��0q�6  $��10,5,0,0q�6  $

 Hand��6O  ��6�     $ Search=� 256O  5e        5g      -   5        $ dgProveedores��5g      $
 true��6.   $��0,5,0,5q�6@   $ Single=�6Q   $
 Auto=�6h   $ False��6�   $��2��6�   $��Center=�6�   $��Center=�6�   $��7��6    5h        5j      $	 CIF��6)    66   �� $	 CIF�  5k      $ Nombre��6)    69   �� $ NombreCompleto�  5l      $ Correo��6)    69   �� $ Correo�  5m      $ 	Teléfono��6)    6;   �� $ Telefono�  5n      $ 	Direccion��6)    6<   �� $ 	Direccion�  5o      $	 100 6-    5p      �� 5q      .R�5r   "   �� ��6(   �� *Imagen+5s      5u      5x      �� 5z      -   5         ��Name$ gbFormularioProducto��5z      $'��!Datos para la compra del producto��65     MaterialDesignGroupBox#���  6`   $��0��6�   $��3��6�   $��1��6�   $��5,10,5,0q�6�   .��5|      � -   5        $ gContenedorDireccion��5|      $

 Hand��65    5~      �� 5      $��* �6(   �� 5�      $��* �6(   �� 5�      $��* �6(    5�      �� 5�      $��* �6+   �� 5�      $��* �6+   .+�5�      �� -   5         ��Name$ Imagen��5�      $��0��6,   $��0��6<   $��2��6I   $ Imagen��6Z   $

 Hand��5�   6   ��5�   �   �� $ Imagen� �� Mode$ TwoWay=� �� NotifyOnValidationError$
 True�� �� UpdateSourceTrigger$ PropertyChanged=� �� ValidatesOnDataErrors$
 True��5�   6   �� 5�      -   5        $ 	txtNombre��5�   �   $��0��6   $��1��6+   $��0��6;   $ Nombre��6H   #��[ 6p   $��Center=�6�   $��	10,0,10,0q�6�   ��6�   �� $ Nombre�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� 5�      -   5        $ txtCantidad��5�   �   $��1��6   $��1��6+   $��1��6;   $ Cantidad��6H   #��[ 6r   $��Center=�6�   $��	10,0,10,0q�6�   6�   �� 5�      -   5        $ txtProveedor��5�   �   $��2��6   $��1��6+   $��2��6;   $ 	Proveedor��6H   #��[ 6s   $��Center=�6�   $��	10,0,10,0q�6�   6�   5�      5�      � 5�      $ 
Horizontal=�6   $��Right=�61   $��Bottom=�6M   $��0,0,5,5q�6h   $��43��6y   $��85��6�   .+�5�      �� -   5        $ btnMostrarCompras��5�      $��75��64   $��38��6?   $	 Mostrar Compras��6K   $
��Left=�6e   $	��Top=�6�   #���  6�   $��0q�6  $��10,5,0,0q�6  $

 Hand��6I  ��6�     $ ListBox=� 256I  5�      � 5�      $ 
Horizontal=�6   $
��Left=�62   $��Center=�6M   $��3��6h   $��1��6u   $��2��6�   $��47��6�   .+�5�      �� -   5        $ 
btnAñadir��5�      $	 añadir producto��6l   #���  6�   $��14(�6�   $��85��6�   $��5,5,0,0q�6�   ��6,     $ CartArrowDown=� 236�   �� 5�      -   5        $ 	btnBorrar��5�      $	 quitar producto��6i   #���  6�   $��5,10,5,5q�6�   $��85��6�   $��14(�6�   $

 Hand��6   ��6,     $ 
CartRemove=� 236   5�      � 5�      $ 
Horizontal=�6   $��Right=�61   $��1��6M   $��3��6]   $��Center=�6j   $��37��6�   $��90��6�   .+�5�      �� -   5        $ 	btnCompra��5�      $��Right=�6,   $	 hacer compra��6�   #���  6�   $��14(�6�   $��85��6�   $��0,5,5,0q�6�   ��6H     $ CartArrowRight=� 236  5�        5�      -   5        $ dgCompra��5�      $
 true��6)   $ Single=�6;   $��5,5,5,5q�6R   $ False��6c   $��5��6   $��4��6�   $��1��6�   $��Center=�6�   $��Center=�6�    5�        5�      $ Producto��6)    6;   �� $ Producto.Nombre�  5�      $ Importe��6)    6:   �� $ Importe� �� StringFormat$ N2��  5�      $ Cantidad��6)    6;   �� $ Cantidad�5�      '	  !MaterialDesignThemes.Wpf.Snackbar	  5�      -   5         	 Name$ sbNotification��5�   &   $	��Top=�5�      $��Center=�6)     	  MessageQueue  5�      4
  .MaterialDesignThemes.Wpf.MessageQueueExtension
  5�      5�      5�      