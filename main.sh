#!/bin/bash

echo "パスワードマネージャーへようこそ！"
echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："

while :
do
    option=
    read option

    case "$option" in
        "Add Password" )
            echo "パスワードの追加は成功しました。";;
        "Get Password" )
            echo "サービス名を入力してください："
            ;;
        "Exit" )
            echo "Thank you!"
            break;;
        * )
            echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。";
    esac
done
