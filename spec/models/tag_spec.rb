describe Tag do
  it 'adds a tag' do
    expect { create(:tag)}.to change(Tag, :count).by(1)
  end
end
