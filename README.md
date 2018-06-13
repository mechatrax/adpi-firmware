adpi-firmware
=============

ADPi を動作させるためのファームウェアを提供します。

## 提供ファイル
動作に必要な次のファイルがパッケージに含まれています。

* /boot/overlays/adpipro-cs0.dtbo  
  ADPi Pro を SPI0 の CS0 で使用するための Device Tree Blob ファイルです。

* /boot/overlays/adpipro-cs1.dtbo  
  ADPi Pro を SPI0 の CS1 で使用するための Device Tree Blob ファイルです。

## パッケージ
インストール時に次のファイルが変更されます。

* /boot/config.txt  
  次のエントリが追記されます。
  ```
  dtoverlay=adpipro-cs0
  ```

インストール時に次のコマンドが実行されます。

* raspi-config  
  I2C を有効にします。  
  ```
  raspi-config nonint do_i2c 0
  ```
  SPI を有効にします。  
  ```
  raspi-config nonint do_spi 0
  ```
  I2C と SPI のクロックソースの動作周波数を固定します。  
  ```
  raspi-config nonint set_config_var core_freq 250 /boot/config.txt
  ```

## 設定
/boot/config.txt を編集することで Device Tree Overlay の設定を行います。

* CS0 にデバイスを接続する場合
  ```
  dtoverlay=adpipro-cs0
  ```
* CS1 にデバイスを接続する場合
  ```
  dtoverlay=adpipro-cs1
  ```
* CS0 と CS1 にデバイスを接続する場合
  ```
  dtoverlay=adpipro-cs1
  dtoverlay=adpipro-cs0
  ```

Device Tree Parameter には次の項目が指定可能です。

* gpio=\<アドレス\>  
  GPIO エキスパンダの使用する I2C アドレスを指定します。  
  デフォルトのアドレスは次のとおりです。

  | ファイル | アドレス |
  |:---------|:---------|
  | adpipro-cs0 | 0x56 |
  | adpipro-cs1 | 0x57 |

* eeprom=\<アドレス\>  
  EEPROM の使用する I2C アドレスを指定します。  
  デフォルトのアドレスは次のとおりです。

  | ファイル | アドレス |
  |:--------|:---------|
  | adpipro-cs0 | 0x26 |
  | adpipro-cs1 | 0x27 |

* irq=\<n\>  
  IRQ の使用する GPIO 番号を指定します。  
  デフォルトの番号は次のとおりです。

  | ファイル | 番号 |
  |:--------|:---------|
  | adpipro-cs0 | 18 |
  | adpipro-cs1 | 25 |

* autocalib  
  スケールまたは更新レートを変更した際に、自動で内部キャリブレーションを行います。  
  デフォルトでは無効です。
