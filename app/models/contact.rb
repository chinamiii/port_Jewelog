class Contact < ApplicationRecord
  enum subject:{
    '---': 0, #---
    about_content: 1, #コンテンツに関するお問い合わせ
    about_harassment: 2, #迷惑行為についてのお問い合わせ
    how_to_use: 3, #アプリの使い方について
    collaboration_request: 4, #コラボ依頼
    other_inquiries: 5,  #その他のお問い合わせ
  }
end
