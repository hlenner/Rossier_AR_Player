//
//  AddTriggerViewController.m
//  AR_Rossier
//
//  Created by Dylan Kyle Davis on 2/19/16.
//  Copyright © 2016 AR_Rossier. All rights reserved.
//

#import "AddTriggerViewController.h"

@interface AddTriggerViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation AddTriggerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    //get the selected image and set the imageview to that image
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    
    _imageView.image = originalImage;
    
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    //picker canceled, do nothing
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)addPhotoButtonTapped:(id)sender {
    
    //Launch an action sheet, then decide to launch photo roll or camera
    UIAlertController *actionSheet = [UIAlertController
                                      alertControllerWithTitle:nil
                                      message:nil
                                      preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cameraAction = [UIAlertAction
                                   actionWithTitle:@"Take a new image"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action) {
                                       
                                       
                                       UIImagePickerController * picker = [[UIImagePickerController alloc] init];
                                       
                                       picker.delegate = self;
                                       picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                                       
                                       [self presentViewController:picker animated:YES completion:NULL];
                                       
                                       
                                   }];
    
    UIAlertAction *photoLibraryAction = [UIAlertAction
                                         actionWithTitle:@"Choose existing image"
                                         style:UIAlertActionStyleDefault
                                         handler:^(UIAlertAction *action) {
                                             
                                             
                                             UIImagePickerController * picker = [[UIImagePickerController alloc] init];
                                             
                                             picker.delegate = self;
                                             picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                                             
                                             [self presentViewController:picker animated:YES completion:NULL];
                                             
                                             
                                         }];
    
    [actionSheet addAction:cameraAction];
    [actionSheet addAction:photoLibraryAction];
    
    UIPopoverPresentationController *popover = actionSheet.popoverPresentationController;
    if (popover)
    {
        popover.sourceView = sender;
        popover.sourceRect = [sender bounds];
        popover.permittedArrowDirections = UIPopoverArrowDirectionAny;
    }
    
    [self presentViewController:actionSheet animated:YES completion:nil];
    
}

- (IBAction)cancelButtonTapped:(id)sender {
    
    [self dismissViewControllerAnimated:NO completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end