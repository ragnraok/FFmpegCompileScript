
//
//  ViewController.m
//  FFMpegTest
//
//  Created by ragnarok on 2021/3/13.
//

#import "ViewController.h"

extern "C" {
#include "libavformat/avformat.h"
#include "libavcodec/avcodec.h"
#include "libavutil/avutil.h"
#include "libswresample/swresample.h"
#include "libswscale/swscale.h"
}

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  av_register_all();
  auto *decoder = avcodec_find_decoder_by_name("h264_videotoolbox");
  auto *encoder = avcodec_find_encoder_by_name("h264_videotoolbox");
  if (decoder != nullptr) {
    NSLog(@"Found h264 videotoolbox decoder");
  } else {
    NSLog(@"Cannot found h264 videotoolbox decoder");
  }

  if (encoder != nullptr) {
    NSLog(@"Found h264 videotoolbox encoder");
  } else {
    NSLog(@"Cannot found h264 videotoolbox encoder");
  }
}


@end
