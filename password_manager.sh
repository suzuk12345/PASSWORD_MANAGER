#!/bin/bash

#ファイルの暗号化にはGunPGの秘密鍵を用いる

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

            #情報を保存するため暗号化ファイルを復号化
            gpg --yes contents.txt.gpg > /dev/null 2>&1

            echo "サービス名を入力してください："
            read serviceName
            echo "サービス名：$serviceName" >> contents.txt

            echo "ユーザー名を入力してください："
            read userName
            echo "ユーザー名：$userName" >> contents.txt

            echo "パスワードを入力してください："
            read password
            echo "パスワード：$password" >> contents.txt

            #ファイルを暗号化、元ファイルを削除して閲覧不可に
            gpg -c --yes contents.txt
            rm contents.txt

            echo "パスワードの追加は成功しました。"
            echo "次の選択肢から入力してください(Add Password/Get Password/Exit)：";;

        "Get Password" )
            serviceName=

            #ファイル内の情報を検索するため暗号化ファイルを復号化
            gpg --yes contents.txt.gpg > /dev/null 2>&1

            echo "サービス名を入力してください："
            read serviceName

            grep -A 2 "サービス名：$serviceName" contents.txt

            if [ $? -ne 0 ] ; then
            echo "そのサービスは登録されていません。"
            fi

            #ファイルを暗号化、元ファイルを削除して閲覧不可に
            gpg -c --yes contents.txt
            rm contents.txt

            echo "次の選択肢から入力してください(Add Password/Get Password/Exit)：";;

        "Exit" )
            echo "Thank you!"
            break;;

        * )
            echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。";
    esac
done
