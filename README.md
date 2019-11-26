# CustomUIButton
自定义UIButton内部view的三种方法

有三种方式可以自定义UIButton内部的imageView、titleLabel的位置
 1. 使用系统提供的方法：
    setImageEdgeInsets
    setTitleEdgeInsets
 
 2. 在layoutSubviews方法中。手动修改imageView、titleLabel控件的frame
    如下 part ①中的代码
 
 3. 想要使用Masonry自己处理约束的话，那就得先设置为不让系统自动处理约束
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    然后使用masonry添加约束即可
    
    但是遇到一个问题此处会有一个问题：
    imageView默认是居中的
    如果只添加设置约束方法，但是不添加任何约束
     [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
     }];
    此时则是图片原始大小，然后居中显示
 
    但是想要通过
        make.size.mas_equalTo(self.imageView.image.size);
    调整约束的话，是无效的。
    但是可以调整上下左右的位置来调整达到类似的效果
