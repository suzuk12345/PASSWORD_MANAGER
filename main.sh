#!/bin/bash

echo "パスワードマネージャーへようこそ！"
echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："

while :
do
    option=
    read option

    case "$option" in
        "Add Password" )
            serviceName=
            userName=
            password=

            echo サービス名を入力してください：
            read serviceName
            echo "サービス名："$serviceName >> contents.txt

            echo ユーザー名を入力してください：
            read userName
            echo "ユーザー名："$userName >> contents.txt

            echo パスワードを入力してください：
            read password
            echo "パスワード："$password >> contents.txt

            echo "パスワードの追加は成功しました。"
            echo "次の選択肢から入力してください(Add Password/Get Password/Exit)：";;
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
