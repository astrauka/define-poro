require 'spec_helper'

module DefinePoro
  describe Define do
    describe '.new' do
      let(:klass) { described_class.new(:b, :a) }

      describe 'class construction properties' do
        subject { klass }

        it 'extends object directly' do
          expect(subject.ancestors[1]).to eq Object
        end

        it 'supports multiple argument accessors' do
          expect(subject.public_instance_methods(false)).to eq %i(b a)
        end

        it 'does not clash with different class arguments' do
          subject
          klass2 = described_class.new(:b, :c)
          expect(klass.public_instance_methods(false)).to eq %i(b a)
          expect(klass2.public_instance_methods(false)).to eq %i(b c)
        end

        it 'supports block' do
          klass2 = described_class.new(:a) do
            def qq
              "a is #{a}"
            end

            def self.class_qq
              'class qq'
            end
          end

          expect(klass2.new('1').qq).to eq 'a is 1'
          expect(klass2.class_qq).to eq 'class qq'
        end
      end

      describe 'object properties' do
        subject { klass.new('b', 'a') }

        it 'assigns attributes in order' do
          expect(subject.a).to eq 'a'
          expect(subject.b).to eq 'b'
        end

        it 'checks attributes count' do
          expect {
            klass.new('b')
          }.to raise_error(ArgumentError)
        end
      end
    end
  end
end
