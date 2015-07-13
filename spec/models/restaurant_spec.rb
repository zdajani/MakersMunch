describe Restaurant do

  it 'adds a restaurant' do
    expect { create(:restaurant)}.to change(Restaurant, :count).by(1)
  end

  it 'does not add a restaurant with the same post_code twice' do
    create(:restaurant)
    restaurant2 = build(:restaurant)
    expect { restaurant2.save }.to change(Restaurant, :count).by(0)
  end
end
