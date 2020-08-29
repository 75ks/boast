class Gender < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'MEN' },
    { id: 3, name: 'WOMEN' },
    { id: 4, name: '選択しない' }
  ]
  end
 