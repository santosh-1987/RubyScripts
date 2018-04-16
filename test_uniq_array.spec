describe "Uniqness test" do
   context "When testing the Bitwise operator" do

      it "should say pass the tests" do
        stat = nil
          [3,5,3,2,4,9].each do |ele|
            stat = stat ^ ele
          end
         expect(stat).to eq false
      end

      it "should say pass the tests" do
        stat = nil
          [3,5].each do |ele|
            stat = stat ^ ele
          end
         expect(stat).to eq false
      end

      it "should say fail the tests when zero is an element" do
        stat = nil
          [3,5,0,3].each do |ele|
            stat = stat ^ ele
          end
         expect(stat).to eq false
      end

   end
end
