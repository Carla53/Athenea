   M S B A M L   `   `   `  ���� B  >Athenea, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:AtheneaAthenea      Athenea.MainWindow   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     'localclr-namespace:Athenea     c _MaterialDesignThemes.MahApps, Version=0.2.7.0, Culture=neutral, PublicKeyToken=df2a72020bd7962a_ [MaterialDesignThemes.Wpf, Version=4.7.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aHmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes     � Title$  Iniciar Sesion��$	��500��$	��500��$	��500��$	��450��$	��450��$	��450�� � WindowStartupLocation$ CenterScreen=�   MaterialDesignBody#���   $
��Bold"�&   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�   TextRenderingMode$
 Auto=�$��14(�$X��Rpack://application:,,,/MaterialDesignThemes.Wpf;component/Resources/Roboto/#Roboto)� � ShowInTaskbar$ False�� � Cursor$
 Hand��.��� -   $��gContenedor��
�������$
{�True��.+��� -    ��Name$ gbInicio��$��Inicio de sesión��  MaterialDesignGroupBox#���  .  (MaterialDesignThemes.Wpf.ColorZoneAssist   
Foreground
 �����$��0��$��16,16,16,16q�$��3��$��2��.���  � RowDefinitions �� $
��107* ��� $
��117* ��� $
��178* �	 � ColumnDefinitions	 �� $
��Auto ��� $��* �.+��� $��1��$��2��$	��Top=�$��0,10,0,0q�$��Imagenes\logo.png��$	��150��$	��130��$��Uniform=��� -   
 ��Name$
 	cbUsuario��$��1��$��1��)  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Usuario�� & "MaterialDesignFloatingHintComboBox#��[ $��
10,20,10,0q�$��14(�$��1��$��38��� -    �Name$ gContenedorContra��$��1��$��2��$��0,6,0,0q�	 �� $��* ��� $��37 �.+��� -   $��txtPass��$	��336��$
��Left=�$ Contraseña�� % !MaterialDesignFloatingHintTextBox#��[ $	��Top=�$��	10,10,0,0q�$��14(�$��0��$y�hidden=�G� -   $��pwdPass��$	��336��$
��Left=�$ Contraseña�� ) %MaterialDesignFloatingHintPasswordBox#��[ $	��Top=�$��	10,10,0,0q� G� Password$  ��$��14(�$��0���� -   $��	txtContra��$ Contraseña��#��[ $	��336��$	��Top=�$
��Left=�$��	10,10,0,0q�$y�Hidden=�$��14(��� -    ��Name$ mgEye��$	��Top=�$��Imagenes/eye.png��$��38��$��1��$��0,10,0,0q��� -	    ��Name$ 	btnEntrar�� " MaterialDesignFlatDarkBgButton#���  $��Entrar��$��14(�$��Right=�$	��Top=�$��2��$��2��$��35��$��0,97,5,0q�$��80��$
 Hand��'  !MaterialDesignThemes.Wpf.Snackbar  -
     Name$ sbNotification��$	��Top=�   MessageQueue 4  .MaterialDesignThemes.Wpf.MessageQueueExtension  