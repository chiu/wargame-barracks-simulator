rspec tips



for test number 4 there is an issue

the mocked value  for .should_receive mocks the method and not the instance variable

for example; 
@barracks.should_receive(:food).and_return(1)
      expect(@barracks.can_train_footman?).to be_falsey


    the food method is mocked and not the food variable itself. 