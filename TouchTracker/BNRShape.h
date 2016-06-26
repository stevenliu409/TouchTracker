//
//  BNRShape.h
//  TouchTracker
//
//  Created by Steven Liu on 2016-06-26.
//  Copyright © 2016 Steven Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRShape : NSObject

typedef enum {
    typeCircle,
    typeLine
} ShapeType;


@property (nonatomic, assign) ShapeType type;

@end
