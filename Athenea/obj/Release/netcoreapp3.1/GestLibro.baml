   M S B A M L   `   `   `  ���� B  >Athenea, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:AtheneaAthenea      Athenea.GestLibro   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     'localclr-namespace:Athenea     c _MaterialDesignThemes.MahApps, Version=0.2.7.0, Culture=neutral, PublicKeyToken=df2a72020bd7962a_ [MaterialDesignThemes.Wpf, Version=4.7.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aHmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes     N� Title$  Gestionar Libros��   MaterialDesignBody#���   $
��Bold"�$��16(� N� 
FontFamily$X Rpack://application:,,,/MaterialDesignThemes.Wpf;component/Resources/Roboto/#Roboto)�.��� .+�� -    �Name$ gContenidoUs��
�������$
{�True��$y�Visible=� � RowDefinitions �� $��55 ��� $	��97* � � ColumnDefinitions �� $
��259* ��� $
��381* �.+��  � Orientation$ 
Horizontal=�$
��Left=�$��Bottom=�$��47��.+��� -    ��Name$ btnNuevo�� � ToolTip$ limpiar formulario�� " MaterialDesignFlatDarkBgButton#���  $��14(� � Cursor$
 Hand��$��85��$��5,5,0,0q���0  *MaterialDesignThemes.Wpf.PackIconExtension  	   Kind$	 Clear=�
   Size
 24�� -   $ btnGuardarLi��$ registar��#���  $��14(�$��85��$��5,5,0,0q���  $	 BookPlus=�
 24�� -   $ 	btnBorrar��$ eliminar��#���  $��5,5,0,0q�$��85��$��14(�$
 Hand����  $	 Delete=�
 24�� -   $ 	btnImagen��$ cargar imagen��#���  $��5,10,0,5q�$��85��$��14(�$
 Hand����  $	 	ImageEdit=�
 24d� -    d�Name$ 
btnAñadir��$ añadir nuevos elementos��#���  $��5,10,5,5q�$��85��$��14(�$
 Hand����  $	 ListBox=�
 24�� -    ��Name$ gbFormulario��$��Datos de libro��  MaterialDesignGroupBox#���  $��1��$��5,5,5,5q�.��� -   $ gContenedor5a��$
 Hand�� �� $��* ��� $��* ��� $��* ��� $��* ��� $��* ��� $��* � �� $��* ��� $��* �.+��� -	    ��Name$ txtISBN��$��0��$��0��$��0��)  #MaterialDesignThemes.Wpf.HintAssist   Hint$
 ISBN�� % !MaterialDesignFloatingHintTextBox#��[ $��Center=�$
��10,0q�����  �� Path$
 ISBN� �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=� �� NotifyOnValidationError$
 True�� �� ValidatesOnDataErrors$
 True���� -
   $ 	txtTitulo��$��1��$��0��$��1��$ Título��#��[ $��Center=�$
��10,0q����� $ Nombre�$ TwoWay=�$ PropertyChanged=�$
 True��$
 True���� -   $ txtAutor��$��2��$��0��$��2��$ Autor��#��[ $��Center=�$��	10,0,10,0q����� $ Autor�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� -    ��Name$ cbTipo��$��3��$��0��$��3��$
 Tipo�� & "MaterialDesignFloatingHintComboBox#��[ $��Center=�$��	10,0,10,0q� �� SelectedValue �� $ TipoId�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� -   $ cbEditorial��$��4��$��0��$��4��$ 	Editorial��#��[ $��Center=�$
��10,0q�$��38�� �� $ EditorialId�$ TwoWay=�$ PropertyChanged=�$
 True���� -   $ txtStock��$��5��$��0��$��5��$ Stock��#��[ $��Center=�$
��10,0q����� $ Stock�$ TwoWay=�$ PropertyChanged=�$
 True��$
 True���� -   $ 
txtEdicion��$��7��$��1��$��0��$ Edicion��#��[ $��Center=�$��	10,0,10,0q����� $ Edicion�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� -   $ 	txtPrecio��$��8��$��1��$��1��$ Precio��#��[ $��Center=�$��	10,0,10,0q����� $ Precio�$ TwoWay=�$
 True�� �� StringFormat$ N2��$
 True���� -   $ txtDescripcion��$��9��$��1��$��2�� �� TextWrapping$
 Wrap=�$ Descripción��#��[ $��Center=�$��	10,0,10,0q����� $ Descripcion�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� -   $ cbProveedor��$��10��$��1��$��3��$ 
Prooveedor��#��[ $��Center=�$��	10,0,10,0q� �� $ ProveedorId�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� -    ��Name$ Imagen��$��1��$��4��$��2��$��5q�$ Imagen������ *Imagen+$ TwoWay=�$
 True��$ PropertyChanged=�$
 True��� -   $ gDatos��$��0��$��2��$��1��$	��758�� �� $	��11* ��� $
��100* �.+�� $ 
Horizontal=�$
��Left=�$��0,0,0,5q�$��Bottom=�$��0��$��43��$	��296��.+��� -   $ txtBusquedaUs��$��0��$
��Left=�$	��201��#��[ $ Valor a buscar��$��Center=��� -   $ 	btnBuscar��$��85��$��38��$ Buscar Libro��$
��Left=�$	��Top=�#���  $��16(�$��0q�$��10,5,0,0q�$
 Hand����  $	 Search=�
 24&   System.Windows.Controls.DataGrid  -     Name$ dgLibros��$��0,5,5,5q�$��1��   
IsReadOnly$
 true��   SelectionMode$ Single=�$   HorizontalScrollBarVisibility$
 Auto=�   AutoGenerateColumns$ False��   Columns 4  .System.Windows.Controls.DataGridTemplateColumn  ,  &System.Windows.Controls.DataGridColumn   Width5  /System.Windows.Controls.DataGridLengthConverter$	 100     CellTemplate  �� .R��� ���� *Imagen+0  *System.Windows.Controls.DataGridTextColumn  !   Header$! Título��1  +System.Windows.Controls.DataGridBoundColumn"   Binding" �� $ Nombre�  $
! ISBN��" �� $
 ISBN�  $! Autor��" �� $ Autor�  $
! Tipo��" �� $ Tipo.Nombre�  $! 	Editorial��" �� $ Editorial.Nombre�  $
! Tipo��" �� $ Tipo.Nombre�  $! Descripción��" �� $ Descripcion�  $! Stock��" �� $ Stock�  $! Precio��" �� $ Precio�$ N2��  $! Edicion��" �� $ Edicion�  $! 
Prooveedor��" �� $ Proveedor.Nombre�'	  !MaterialDesignThemes.Wpf.Snackbar	  -   # 	 Name$# sbNotification��$	��Top=�$��Center=�$ 	  MessageQueue$ 4
  .MaterialDesignThemes.Wpf.MessageQueueExtension
  � -   $ gAñadirTipos_Editoriales��$��1��$��2��$��2,0,2,0q�$��0�� �� $��55 ��� $	��46* ��� $	��67* ��� $	��56* ��� $	��56* ��� $	��56* ��� $	��56* ��� $	��55* ��� $	��55* ��� $	��55* � �� $
��373* ��� $
��373* �.+�� $ 
Horizontal=�$
��Left=�$��Bottom=�$��0,0,0,5q�$��37��$	��185��.+��� -   $ btnNuevoTipo��$ 
nuevo tipo��#���  $��14(�$
 Hand��$��90��$��0,5,0,0q���  $	 Clear=�
 24�� -   $ btnGuardarTipo��$ registar��#���  $��14(�$
 Hand��$��90��$��5,5,0,0q���  $	 NotePlus=�
 24�� -   $ btnBorrarTipo��$ eliminar��#���  $��14(�$
 Hand��$��90��$��5,5,0,0q���  $	 Delete=�
 24� $ 
Horizontal=�$
��Left=�$��Bottom=�$��0,0,0,5q�$��37��$��4��.+��� -   $ btnNuevaEditorial��$ nueva editorial��#���  $��14(�$
 Hand��$��90��$��0,5,0,0q���  $	 Clear=�
 24�� -   $ btnGuardarEditorial��$ registar��#���  $��14(�$
 Hand��$��90��$��5,5,0,0q���  $	 
LibraryAdd=�
 24�� -   $ btnBorrarEditorial��$ eliminar��#���  $��14(�$
 Hand��$��90��$��5,5,0,0q���  $	 Delete=�
 24�� -    $ btnImagenEditorial��$ cargar imagen��#���  $��14(�$
 Hand��$��90��$��5,5,0,0q���  $	 Image=�
 24� -!   % �Name$% wpTipo��$ 
Horizontal=�$
��Left=�$��Center=�$��1��$��0��$��42��$	��201��.+��� -"   $ 
txtTipoAdd��$��0��$
��Left=�$	��201��#��[ $ Tipo a añadir��$��Center=����� $ Nombre�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True��  -#   $ 
dgTiposAdd��$
 true��$ Single=�$��2��$
 Auto=�$ False��$��2��$��Center=�$��Center=�$��2��$��0,7,5,0q�   $! Id��" �� $ TipoId�  $
! Tipo��" �� $ Nombre��� -$   & ��Name$& spEditorialNombre��' �� Orientation$' 
Horizontal=�$
��Left=�$	��Top=�$��0,7,0,0q�$��37��$��5��$��0��$��2��$	��387��.+��� -%   $ txtNombreEditorialAdd��$��0��$	��180��  MaterialDesignTextBox#��[ $ Nombre de la editorial��$��0,5,0,0q����� $ Nombre�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� -&   $ txtEmailEditorialAdd��$��0��$	��200��#��[ $ Email��$��7,5,0,0q����� $ Correo�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� -'   $ ImagenEditorial��$��5��$��1��$
��Left=�$
��30,0q�$��37��$	��150��$ Imagen������ *Imagen+$ TwoWay=��� -(   $& spEditorialDireccion��$' 
Horizontal=�$
��Left=�$��2��$	��Top=�$��0,7,0,0q�$��37��$��6��$��0��$	��691��.+��� -)   $ txtCalleEditorialAdd��$��0��$	��220��#��[ $ Nombre Calle��$��0,5,0,0q����� $ Calle�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� -*   $ txtCPEditorialAdd��$��0��$	��120��#��[ $ Codigo Postal��$��7,5,0,0q����� $ CodigoPostal�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� -+   $ txtProvinciaEditorialAdd��$��0��$	��130��#��[ $ 	Provincia��$��7,5,0,0q����� $ 	Provincia�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True���� -,   $ txtConcelloEditorialAdd��$��0��$	��200��#��[ $ Concello��$��7,5,0,0q����� $ Concello�$ TwoWay=�$
 True��$ PropertyChanged=�$
 True��  --   $ dgEditorialesAdd��$
 true��$��0,5,5,5q�$ Single=�$
 Auto=�$ False��$��3��$��Center=�$��Center=�$��7��$��2��   $! Id��" �� $ EditorialId�  $	 100   �� .R��� ���� *Imagen+  $! Nombre��" �� $ Nombre�  $! Email��" �� $ Correo�  $! 	Provincia��" �� $ 	Provincia�  $! Calle��" �� $ Calle�  $! Concello��" �� $ Concello�  $! Código Postal��" �� $ CodigoPostal�