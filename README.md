ghaでaws ecrにイメージプッシュしてecsで動かす
中身は適当で

## ざっくり接続方法
1. 対象のAWSで接続用のIAMロールを作成し、secrets.AWS_IAM_ROLE_ARNに登録
2. test.yamlのchannel-id、secrets.SLACK_BOT_TOKENにそれぞれ接続対象のslackで登録(slack側の設定は割愛)
3. tfstateを管理するs3バケットを作成し、バケットポリシーのPrincipalには1で作成したIAMロール、Resourceにはs3のarnを指定
5. main.tfのbucketにtfstateを管理するs3バケット名を記載
