//
//  ZL_MyInfoViewController.m
//  XM_iphone
//
//  Created by 朱金龙 on 16/6/8.
//  Copyright © 2016年 XiuMei. All rights reserved.
//

#import "ZL_MyInfoViewController.h"
#import "UIFountion.h"


#import "UMSocial.h"

@implementation ZL_MyInfoViewController
-(void) viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor blueColor];
    
    UIButton *qqLogin=[[UIButton alloc] initWithFrame:CGRectMake(100, 20, 100, 30)];
    qqLogin.tag=1000;
    [qqLogin setTitle:@"QQLogin" forState:UIControlStateNormal];
    qqLogin.titleLabel.textColor=[UIColor whiteColor];
    
    qqLogin.backgroundColor=[UIColor redColor];
    UIButton *wxLogin=[[UIButton alloc] initWithFrame:CGRectMake(100, 60, 100, 30)];
    [wxLogin setTitle:@"wxLogin" forState:UIControlStateNormal];
    wxLogin.tag=2000;
    UIButton *wbLogin=[[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    wbLogin.tag=3000;
    [wbLogin setTitle:@"微博登陆" forState:UIControlStateNormal];

    
    wbLogin.titleLabel.textColor=[UIColor whiteColor];

    [qqLogin addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [wxLogin addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [wbLogin addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:qqLogin];
    [self.view addSubview:wbLogin];
    [self.view addSubview:wxLogin];
}
-(void) login:(UIButton *)sender
{
    if (sender.tag==1000) {
        UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQQ];
        
        snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
            
            //          获取微博用户名、uid、token等
            
            if (response.responseCode == UMSResponseCodeSuccess) {
                
                NSDictionary *dict = [UMSocialAccountManager socialAccountDictionary];
                UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
                NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
                
            }});
    }
    else if(sender.tag==2000)
    {
        UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToWechatSession];
        
        snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
            
            if (response.responseCode == UMSResponseCodeSuccess) {
                
                NSDictionary *dict = [UMSocialAccountManager socialAccountDictionary];
                UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
                NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
                
            }
            
        });
    }
    else
    {
        UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
        
        snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
            
            //          获取微博用户名、uid、token等
            
            if (response.responseCode == UMSResponseCodeSuccess) {
                
                NSDictionary *dict = [UMSocialAccountManager socialAccountDictionary];
                UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
                NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
                
            }});
    }
}
@end
