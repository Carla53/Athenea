   M S B A M L   `   `   `  ���� B  >Athenea, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:AtheneaAthenea      Athenea.GestPapeleria   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     'localclr-namespace:Athenea     c _MaterialDesignThemes.MahApps, Version=0.2.7.0, Culture=neutral, PublicKeyToken=df2a72020bd7962a_ [MaterialDesignThemes.Wpf, Version=4.7.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aHmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes     N� Title$  Gestionar Papelería��   MaterialDesignBody#���   $
��Bold"�$��16(� N� 
FontFamily$X Rpack://application:,,,/MaterialDesignThemes.Wpf;component/Resources/Roboto/#Roboto)�.��� .+�� -    �Name$ gContenidoPap��$��Stretch=�
�������$
{�True�� � RowDefinitions �� $��60 ��� $
��449* � � ColumnDefinitions �� $
��159* ��� $
��241* �.+��  � Orientation$ 
Horizontal=�$
��Left=�$��Bottom=�.+��� -    ��Name$ btnNuevo�� � ToolTip$ limpiar formulario�� " MaterialDesignFlatDarkBgButton#���  $��14(� � Cursor$
 Hand��$��72��$��5,5,0,0q���0  *MaterialDesignThemes.Wpf.PackIconExtension  	   Kind$	 Clear=�
   Size
 24�� -   $ btnGuardarLi��$ registar��#���  $��14(�$��72��$��5,5,0,0q�$
 Hand����  $	 PenPlus=�
 24�� -   $ 	btnBorrar��$ eliminar��#���  $��5,5,0,0q�$��72��$��14(�$
 Hand����  $	 Delete=�
 24�� -   $ 	btnImagen��$ cargar imagen��#���  $��5,10,0,5q�$��72��$��14(�$
 Hand����  $	 	ImageEdit=�
 24d� -    d�Name$! btnAñadirCategorias_Marcas��$ añadir nuevos elementos��#���  $��5,10,5,5q�$��72��$��14(�$
 Hand����  $	 ListBox=�
 24�� -    ��Name$ gbFormularioPapeleria��$��Datos Producto��  MaterialDesignGroupBox#���  $��0��$��5,2,5,5q�$��1��.��� -   $ gContenedor�� �� $��* ��� $��* ��� $��* ��� $��* ��� $��* � �� $��* ��� $��* �.+��� -	    ��Name$ 	txtNombre��$��0��$��0��$��0��)  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Nombre�� % !MaterialDesignFloatingHintTextBox#��[ $��Center=�$
��10,0q�����  �� Path$ Nombre� �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=� �� NotifyOnValidationError$
 True�� �� ValidatesOnDataErrors$
 True���� -
    ��Name$ cbCategoria��$��1��$��0��$��1��$ 
Categoría�� & "MaterialDesignFloatingHintComboBox#��[ $��Center=�$��	10,0,10,0q�$��38�� �� SelectedValue �� $ CategoriaId�$ TwoWay=�$ PropertyChanged=�$
 True���� -   $ cbMarca��$��2��$��0��$��2��$ Marca��$��Center=�#��[ $��38��$��	10,0,10,0q� �� $ MarcaId�$ TwoWay=�$ PropertyChanged=�$
 True���� -   $ txtStock��$��5��$��0��$��3��$ Stock��#��[ $��Center=�$
��10,0q����� $ Stock�$ TwoWay=�$ PropertyChanged=�$
 True��$
 True���� -   $ txtColor��$��4��$��4��$��0��$ Color��#��[ $��Center=�$
��10,0q����� $ Color�$ TwoWay=�$ PropertyChanged=�$
 True��$
 True���� -   $ 
txtTamaño��$��5��$��1��$��0��$ Tamaño��#��[ $��Center=�$��	10,0,10,0q����� $ Tamaño�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� -   $ 	txtPrecio��$��6��$��1��$��1��$ Precio��#��[ $��Center=�$��	10,0,10,0q����� $ Precio�$ TwoWay=�$
 True�� �� StringFormat$ N2��$
 True���� -   $ cbProveedor��$��7��$��1��$��2��$ 
Prooveedor��$��Center=�#��[ $��38��$��	10,0,10,0q� �� $ ProveedorId�$ TwoWay=�$ PropertyChanged=�$
 True���� -    ��Name$ Imagen��$��1��$��3��$��2��$��5q�$ Imagen������ *Image+$ TwoWay=�$
 True��$ PropertyChanged=�$
 True��� -   $ gDatos��$��1��$��2��$	��758�� �� $��55 ��� $
��100* �.+�� $ 
Horizontal=�$
��Left=�$��0��$��5,0,0,0q�$��Bottom=�.+��� -   $ txtBusquedaPap��$��0��$
��Left=�$	��201��#��[ $ Valor a buscar��$��Center=��� -   $ 	btnBuscar��$��85��$��38��$ BUscar Producto��$
��Left=�$	��Top=�#���  $��16(�$��0q�$��10,5,0,0q�$
 Hand����  $	 Search=�
 24&   System.Windows.Controls.DataGrid  -     Name$ dgPapeleria��   
IsReadOnly$
 true��$��5,10,5,5q�   SelectionMode$ Single=�$   HorizontalScrollBarVisibility$
 Auto=�   AutoGenerateColumns$ False��$��Center=�$��Center=�$��1��   Columns 4  .System.Windows.Controls.DataGridTemplateColumn  ,  &System.Windows.Controls.DataGridColumn   Width5  /System.Windows.Controls.DataGridLengthConverter$	 100    CellTemplate �� .R��� ���� *Imagen+0  *System.Windows.Controls.DataGridTextColumn      Header$  Nombre��1  +System.Windows.Controls.DataGridBoundColumn!   Binding! �� $ Nombre�  $  	Categoria��! �� $ Categoria.Nombre�  $  Stock��! �� $ Stock�  $  Precio��! �� $ Precio�$ N2��  $  Marca��! �� $ Marca.Nombre�  $  Color��! �� $ Color�  $  Tamaño��! �� $ Tamaño�  $  
Prooveedor��! �� $ Proveedor.Nombre�'	  !MaterialDesignThemes.Wpf.Snackbar	  -   " 	 Name$" sbNotification��$	��Top=�$��Center=�# 	  MessageQueue# 4
  .MaterialDesignThemes.Wpf.MessageQueueExtension
  � -   $ gAñadirMarcas_Categorias��$��1��$��2��$��2,0,2,0q�$��0�� �� $��55 ��� $	��46* ��� $	��67* ��� $	��56* ��� $	��56* ��� $	��56* ��� $	��56* ��� $	��55* ��� $	��55* ��� $	��55* � �� $
��373* ��� $
��373* �.+�� $ 
Horizontal=�$
��Left=�$��Bottom=�$��37��.+��� -   $ btnNuevaCatogoria��$ nueva categoria��#���  $��14(�$
 Hand��$��90��$��0,5,0,0q���  $	 Clear=�
 24�� -   $ btnGuardarCatogoria��$ registar��#���  $��14(�$
 Hand��$��90��$��5,5,0,0q���  $	 NotePlus=�
 24�� -   $ btnBorrarCategoria��$ eliminar��#���  $��14(�$
 Hand��$��90��$��5,5,0,0q���  $	 Delete=�
 24� $ 
Horizontal=�$
��Left=�$��Bottom=�$��0,0,0,5q�$��37��$��5��.+��� -   $ btnNuevaMarca��$ nueva marca��#���  $��14(�$
 Hand��$��90��$��0,5,0,0q���  $	 Clear=�
 24�� -   $ btnGuardarMarca��$ registar��#���  $��14(�$
 Hand��$��90��$��5,5,0,0q���  $	 
LibraryAdd=�
 24�� -   $ btnBorrarMarca��$ eliminar��#���  $��14(�$
 Hand��$��90��$��5,5,0,0q���  $	 Delete=�
 24�� -   $ btnImagenMarca��$ cargar imagen��#���  $��14(�$
 Hand��$��90��$��5,5,0,0q���  $	 Image=�
 24� -   $ �Name$$ wpCategoria��$ 
Horizontal=�$
��Left=�$��Center=�$��1��$��0��$��42��$	��201��.+��� -    $ txtCategoriaAdd��$��0��$
��Left=�$	��201��#��[ $ Categoria a añadir��$��Center=����� $ Nombre�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True��  -!   $ dgCategoriaAdd��$
 true��$ Single=�$��2��$
 Auto=�$ False��$��3��$��Center=�$��Center=�$��2��$��0,7,5,0q�   $  Id��! �� $ CategoriaId�  $  	Categoria��! �� $ Nombre�  $  Marca��! �� $ Marca.Nombre��� -"   % ��Name$% spMarca��& �� Orientation$& 
Horizontal=�$
��Left=�$	��Top=�$��0,7,0,0q�$��37��$��6��$��0��$��2��.+��� -#   $ txtNombreMarcaAdd��$��0��$	��180��  MaterialDesignTextBoxBase#��[ $ Nombre de la marca������ $ Nombre�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� -$   $ ImagenMarca��$��Right=�$	��150��$��0,0,30,0q�$��6��$��Center=����� *Imagen+$ TwoWay=�  -%   $ 
dgMarcaAdd��$
 true��$��0,5,5,5q�$ Single=�$
 Auto=�$ False��$��3��$��Center=�$��Center=�$��7��$��2��   $  Id��! �� $ MarcaId�  $  Nombre��! �� $ Nombre�  $	 100  �� .R��� ���� *Imagen+