   M S B A M L   `   `   `  ����B  >Athenea, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:AtheneaAthenea  5          Athenea.GestPapeleria   5      W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      'localclr-namespace:Athenea     5      c _MaterialDesignThemes.MahApps, Version=0.2.7.0, Culture=neutral, PublicKeyToken=df2a72020bd7962a_ [MaterialDesignThemes.Wpf, Version=4.7.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aHmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes   5	   #     N� Title$  Gestionar Papelería��6      MaterialDesignBody#���   5      $
��Bold"�5      $��16(�5       N� 
FontFamily$X Rpack://application:,,,/MaterialDesignThemes.Wpf;component/Resources/Roboto/#Roboto)�5      .��5      � .+�5   
   � -   5         �Name$ gContenidoPap��5      $��Stretch=�6&   
�������$
{�True��6Z    � RowDefinitions 5      �� 5      $��60 �6    �� 5      $
��449* �6     � ColumnDefinitions 5      �� 5      $
��159* �6#   �� 5      $
��241* �6#   .+�5      �  � Orientation$ 
Horizontal=�6   $
��Left=�61   $��Bottom=�6L   .+�5      �� -   5         ��Name$ btnNuevo��5       � ToolTip$ limpiar formulario��6c    " MaterialDesignFlatDarkBgButton#���  6�   $��14(�6�    � Cursor$
 Hand��6�   $��72��6�   $��5,5,0,0q�6�   ��6+   0  *MaterialDesignThemes.Wpf.PackIconExtension  	   Kind$	 Clear=�
   Size
 246�   �� 5       -   5        $ btnGuardarLi��5       $ registar��6i   #���  6|   $��14(�6�   $��72��6�   $��5,5,0,0q�6�   $
 Hand��6�   ��6/     $	 PenPlus=�
 246�   �� 5!      -   5        $ 	btnBorrar��5!      $ eliminar��6e   #���  6x   $��5,5,0,0q�6�   $��72��6�   $��14(�6�   $
 Hand��6�   ��6,     $	 Delete=�
 246�   �� 5"      -   5        $ 	btnImagen��5"      $ cargar imagen��6h   #���  6�   $��5,10,0,5q�6�   $��72��6�   $��14(�6�   $
 Hand��6�   ��6,     $	 	ImageEdit=�
 246�   d� 5#      -   5         d�Name$! btnAñadirCategorias_Marcas��5#      $ añadir nuevos elementos��6}   #���  6�   $��5,10,5,5q�6�   $��72��6�   $��14(�6�   $
 Hand��6  ��6C     $	 ListBox=�
 246  5%      �� 5'      -   5         ��Name$ gbFormularioPapeleria��5'      $��Datos Producto��66     MaterialDesignGroupBox#���  6N   $��0��6   $��5,2,5,5q�6�   $��1��6�   .��5)      � -   5        $ gContenedor��5)       5+      �� 5,      $��* �6(   �� 5-      $��* �6(   �� 5.      $��* �6(   �� 5/      $��* �6(   �� 50      $��* �6(    53      �� 54      $��* �6+   �� 55      $��* �6+   .+�58      �� -	   5         ��Name$ 	txtNombre��58   �   $��0��6   $��0��6+   $��0��6;   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Nombre��6H    % !MaterialDesignFloatingHintTextBox#��[ 6p   $��Center=�6�   $
��10,0q�6�   ��6�   ��  �� Path$ Nombre� �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=� �� NotifyOnValidationError$
 True�� �� ValidatesOnDataErrors$
 True���� 5=      -
   5         ��Name$ cbCategoria��5=   �   $��1��6   $��0��6,   $��1��6<   $ 
Categoría��6I    & "MaterialDesignFloatingHintComboBox#��[ 6t   $��Center=�6�   $��	10,0,10,0q�6�   $��38��5?   9    �� SelectedValue 5=   �   �� $ CategoriaId�$ TwoWay=�$ PropertyChanged=�$
 True��5?   9   �� 5A      -   5        $ cbMarca��5A   p   $��2��6   $��0��6,   $��2��6<   $ Marca��6I   $��Center=�6�   #��[ 6�   $��38��6�   $��	10,0,10,0q�6�    6�   �� $ MarcaId�$ TwoWay=�$ PropertyChanged=�$
 True���� 5E      -   5        $ txtStock��5E   �   $��5��6   $��0��6+   $��3��6;   $ Stock��6H   #��[ 6o   $��Center=�6�   $
��10,0q�6�   ��6�   �� $ Stock�$ TwoWay=�$ PropertyChanged=�$
 True��$
 True���� 5J      -   5        $ txtColor��5J   �   $��4��6   $��4��6+   $��0��68   $ Color��6H   #��[ 6o   $��Center=�6�   $
��10,0q�6�   ��6�   �� $ Color�$ TwoWay=�$ PropertyChanged=�$
 True��$
 True���� 5O      -   5        $ 
txtTamaño��5O   �   $��5��6   $��1��6+   $��0��6;   $ Tamaño��6H   #��[ 6p   $��Center=�6�   $��	10,0,10,0q�6�   ��6�   �� $ Tamaño�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� 5T      -   5        $ 	txtPrecio��5T   �   $��6��6   $��1��6+   $��1��6;   $ Precio��6H   #��[ 6p   $��Center=�6�   $��	10,0,10,0q�6�   ��6�   �� $ Precio�$ TwoWay=�$
 True�� �� StringFormat$ N2��$
 True���� 5Y      -   5        $ cbProveedor��5Y   u   $��7��6   $��1��6,   $��2��6<   $ 
Prooveedor��6I   $��Center=�6�   #��[ 6�   $��38��6�   $��	10,0,10,0q�6�    6   �� $ ProveedorId�$ TwoWay=�$ PropertyChanged=�$
 True���� 5]      -   5         ��Name$ Imagen��5]      $��1��6,   $��3��6<   $��2��6I   $��5q�6Z   $ Imagen��6e   ��6�   �� *Image+$ TwoWay=�$
 True��$ PropertyChanged=�$
 True��5a      5b      � 5d      -   5        $ gDatos��5d      $��1��6#   $��2��63   $	��758��6D    5e      �� 5f      $��55 �6$   �� 5g      $
��100* �6$   .+�5j      � $ 
Horizontal=�6   $
��Left=�65   $��0��6P   $��5,0,0,0q�6]   $��Bottom=�6n   .+�5l      �� -   5        $ txtBusquedaPap��5l   �   $��0��6   $
��Left=�6+   $	��201��6F   #��[ 6R   $ Valor a buscar��6�   $��Center=�6�   �� 5m      -   5        $ 	btnBuscar��5m      $��85��60   $��38��6;   $ BUscar Producto��6G   $
��Left=�6a   $	��Top=�6|   #���  6�   $��16(�6  $��0q�6  $��10,5,0,0q�6   $
 Hand��6J  ��6�     $	 Search=�
 246J  5o      &   System.Windows.Controls.DataGrid  5q      -   5          Name$ dgPapeleria��5q         
IsReadOnly$
 true��60   $��5,10,5,5q�6B      SelectionMode$ Single=�6T   $   HorizontalScrollBarVisibility$
 Auto=�6k      AutoGenerateColumns$ False��6�   $��Center=�6�   $��Center=�6�   $��1��6�      Columns 5r      4  .System.Windows.Controls.DataGridTemplateColumn  5t      ,  &System.Windows.Controls.DataGridColumn   Width5  /System.Windows.Controls.DataGridLengthConverter$	 100 61      CellTemplate 5u      �� 5v   "   .R�5w   &   �� ��6,   �� *Imagen+5x   #   5z      0  *System.Windows.Controls.DataGridTextColumn  5{          Header$  Nombre��6-   1  +System.Windows.Controls.DataGridBoundColumn!   Binding! 6=   �� $ Nombre�  5|      $  	Categoria��6-   ! 6@   �� $ Categoria.Nombre�  5}      $  Stock��6-   ! 6<   �� $ Stock�  5~      $  Precio��6-   ! 6=   �� $ Precio�$ N2��  5      $  Marca��6-   ! 6<   �� $ Marca.Nombre�  5�      $  Color��6-   ! 6<   �� $ Color�  5�      $  Tamaño��6-   ! 6=   �� $ Tamaño�  5�      $  
Prooveedor��6-   ! 6A   �� $ Proveedor.Nombre�5�      5�      '	  !MaterialDesignThemes.Wpf.Snackbar	  5�      -   5        " 	 Name$" sbNotification��5�   &   $	��Top=�5�      $��Center=�6)   # 	  MessageQueue# 5�      4
  .MaterialDesignThemes.Wpf.MessageQueueExtension
  � 5�      -   5        $ gAñadirMarcas_Categorias��5�      $��1��65   $��2��6E   $��2,0,2,0q�6V   $��0��6g    5�      �� 5�      $��55 �6$   �� 5�      $	��46* �6$   �� 5�      $	��67* �6$   �� 5�      $	��56* �6$   �� 5�      $	��56* �6$   �� 5�      $	��56* �6$   �� 5�      $	��56* �6$   �� 5�      $	��55* �6$   �� 5�      $	��55* �6$   �� 5�      $	��55* �6$    5�      �� 5�      $
��373* �6'   �� 5�      $
��373* �6'   .+�5�      � $ 
Horizontal=�6   $
��Left=�65   $��Bottom=�6P   $��37��6k   .+�5�      �� -   5        $ btnNuevaCatogoria��5�      $ nueva categoria��6p   #���  6�   $��14(�6�   $
 Hand��6�   $��90��6�   $��0,5,0,0q�6�   ��68     $	 Clear=�
 246�   �� 5�      -   5        $ btnGuardarCatogoria��5�      $ registar��6u   #���  6�   $��14(�6�   $
 Hand��6�   $��90��6�   $��5,5,0,0q�6�   ��6:     $	 NotePlus=�
 246�   �� 5�      -   5        $ btnBorrarCategoria��5�      $ eliminar��6r   #���  6�   $��14(�6�   $
 Hand��6�   $��90��6�   $��5,5,0,0q�6�   ��69     $	 Delete=�
 246�   5�      � 5�      $ 
Horizontal=�6   $
��Left=�65   $��Bottom=�6P   $��0,0,0,5q�6k   $��37��6|   $��5��6�   .+�5�      �� -   5        $ btnNuevaMarca��5�      $ nueva marca��6l   #���  6�   $��14(�6�   $
 Hand��6�   $��90��6�   $��0,5,0,0q�6�   ��64     $	 Clear=�
 246�   �� 5�      -   5        $ btnGuardarMarca��5�      $ registar��6s   #���  6�   $��14(�6�   $
 Hand��6�   $��90��6�   $��5,5,0,0q�6�   ��66     $	 
LibraryAdd=�
 246�   �� 5�      -   5        $ btnBorrarMarca��5�      $ eliminar��6n   #���  6�   $��14(�6�   $
 Hand��6�   $��90��6�   $��5,5,0,0q�6�   ��65     $	 Delete=�
 246�   �� 5�      -   5        $ btnImagenMarca��5�      $ cargar imagen��6m   #���  6�   $��14(�6�   $
 Hand��6�   $��90��6�   $��5,5,0,0q�6�   ��65     $	 Image=�
 246�   5�      � 5�      -   5        $ �Name$$ wpCategoria��5�      $ 
Horizontal=�61   $
��Left=�6J   $��Center=�6e   $��1��6�   $��0��6�   $��42��6�   $	��201��6�   .+�5�      �� -    5        $ txtCategoriaAdd��5�   �   $��0��6   $
��Left=�6+   $	��201��6F   #��[ 6R   $ Categoria a añadir��6�   $��Center=�6�   ��6�   �� $ Nombre�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True��5�        5�      -!   5        $ dgCategoriaAdd��5�      $
 true��63   $ Single=�6E   $��2��6\   $
 Auto=�6p   $ False��6�   $��3��6�   $��Center=�6�   $��Center=�6�   $��2��6  $��0,7,5,0q�6   5�        5�      $  Id��6-   ! 69   �� $ CategoriaId�  5�      $  	Categoria��6-   ! 6@   �� $ Nombre�  5�      $  Marca��6-   ! 6<   �� $ Marca.Nombre�5�      �� 5�      -"   5        % ��Name$% spMarca��5�      & �� Orientation$& 
Horizontal=�6.   $
��Left=�6G   $	��Top=�6b   $��0,7,0,0q�6z   $��37��6�   $��6��6�   $��0��6�   $��2��6�   .+�5�      �� -#   5        $ txtNombreMarcaAdd��5�      $��0��69   $	��180��6F     MaterialDesignTextBoxBase#��[ 6R   $ Nombre de la marca��6�   ��6�   �� $ Nombre�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True��5�      �� 5�      -$   5        $ ImagenMarca��5�   R   $��Right=�6   $	��150��64   $��0,0,30,0q�6@   $��6��6g   $��Center=�6t   ��6�   �� *Imagen+$ TwoWay=�  5�      -%   5        $ 
dgMarcaAdd��5�      $
 true��6/   $��0,5,5,5q�6A   $ Single=�6R   $
 Auto=�6i   $ False��6�   $��3��6�   $��Center=�6�   $��Center=�6�   $��7��6  $��2��6   5�        5�      $  Id��6-   ! 69   �� $ MarcaId�  5�      $  Nombre��6-   ! 6=   �� $ Nombre�  5�      $	 100 61    5�      �� 5�   "   .R�5�   &   �� ��6,   �� *Imagen+5�   #   5�      5�      5�      5�      5�      5�      