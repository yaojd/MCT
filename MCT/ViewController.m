//
//  ViewController.m
//  MCT
//
//  Created by Judy on 2/5/17.
//  Copyright © 2017 Judy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewDidAppear:(BOOL)animated{
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertController *noCamAlertController = [UIAlertController alertControllerWithTitle:@"No Camera"
                                                                                      message: @"Camera is Needed for this App"
                                                                               preferredStyle:UIAlertControllerStyleAlert                   ];
        [self presentViewController:noCamAlertController animated:YES completion:nil];
        
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)takePhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = NO;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    picker.showsCameraControls = YES;   // There is a bug in iOS 10. Need this setting before manual flash control.
    picker.cameraFlashMode = UIImagePickerControllerCameraFlashModeOn;
    
    [self presentViewController:picker animated:YES completion:NULL];
}


- (IBAction)selectPhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = NO;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    //picker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    
    [self presentViewController:picker animated:YES completion:NULL];

}


/* Fullfill delegate of UIImagePickerController */

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerOriginalImage];
    self.photoView.image = chosenImage;
    
    NSLog(@"Successfully acquired user image.");
    NSLog(@"Image width %f", chosenImage.size.width);
    NSLog(@"Image height %f", chosenImage.size.height);
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}


@end
