//
//  AppInitializer.m
//  HKDev
//
//  Created by HK on 2019/3/26.
//  Copyright © 2019 HK. All rights reserved.
//

#import "AppInitializer.h"
#import "HKTabBarController.h"
#import "HKNavigationController.h"
#import "HKEntryListViewController.h"

@implementation AppInitializer

// Create root view controller
+ (UIViewController * )rootViewController
{
    NSMutableArray *viewControllers = [[NSMutableArray alloc] init];
    
    NSArray *listTypes = @[@(HKEntryListTypeModules), @(HKEntryListTypeComponents), @(HKEntryListTypeFoundations)];
    for (NSNumber *typeNum in listTypes) {
        HKEntryListType type = (HKEntryListType)[typeNum integerValue];
        HKEntryListManager *manager = [[HKEntryListManager alloc] initWithType:type];
        if (manager) {
            HKEntryListViewController *listVC = [[HKEntryListViewController alloc] initWithManager:manager];
            HKNavigationController *nav = [[HKNavigationController alloc] initWithRootViewController:listVC];;
            nav.tabBarItem
            = [[UITabBarItem alloc] initWithTitle:manager.title
                                            image:[UIImage imageNamed:manager.imageName]
                                    selectedImage:[UIImage imageNamed:manager.selectedImageName]];
            [viewControllers addObject:nav];
        }
    }
    
    NSAssert(viewControllers.count > 0, @"Init root view controller failure");
    
    HKTabBarController *tabBarController = [[HKTabBarController alloc] init];
    [tabBarController setViewControllers:[viewControllers copy]];
    return tabBarController;
}

@end
