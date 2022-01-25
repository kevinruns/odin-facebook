# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(id: 2, email: "asb@gmail.com", created_at: "2021-10-23 17:15:29.916697000 +0000", updated_at: "2021-10-23 17:15:29.916697000 +0000", user_name: "asb", first_name: "Baz", family_name: "Logan", provider: nil, uid: nil)
User.create(id: 3, email: "klen1@gmail.com", created_at: "2021-10-26 17:03:46.045451000 +0000", updated_at: "2021-10-26 17:41:09.299294000 +0000", user_name: "klen", first_name: "kev", family_name: "lenned", provider: nil, uid: nil)
User.create(id: 4, email: "jamer@gmail.com", created_at: "2021-10-27 18:26:50.281847000 +0000", updated_at: "2022-01-22 18:20:57.003780000 +0000", user_name: "jamer", first_name: "Jim", family_name: "Silver", provider: nil, uid: nil)
User.create(id: 5, email: "nail@gmail.com", created_at: "2021-10-27 21:31:34.940122000 +0000", updated_at: "2022-01-06 18:33:18.855237000 +0000", user_name: "nailly", first_name: "Nal", family_name: "Uyo", provider: nil, uid: nil)
User.create(id: 6, email: "kplag@gmail.com", created_at: "2021-11-03 20:37:41.484169000 +0000", updated_at: "2022-01-07 16:35:39.867510000 +0000", user_name: "kplag", first_name: "Koo", family_name: "Plag", provider: nil, uid: nil)


Post.create(id: 8, post: "another post", created_at: "2021-11-14 15:02:13.923084000 +0000", updated_at: "2021-11-15 11:46:04.656018000 +0000", author_id: 2) 
Post.create(id: 9, post: " a post from me updated again and again", created_at: "2021-11-14 21:59:48.980196000 +0000", updated_at: "2021-11-15 11:46:05.896879000 +0000", author_id: 4) 
Post.create(id: 10, post: "test", created_at: "2021-11-17 14:54:00.861217000 +0000", updated_at: "2021-11-17 14:54:00.861217000 +0000", author_id: 4) 
Post.create(id: 11, post: "again alnot", created_at: "2021-11-17 14:54:35.422960000 +0000", updated_at: "2021-11-17 14:54:35.422960000 +0000", author_id: 4) 
Post.create(id: 15, post: "testa", created_at: "2021-11-17 18:44:01.750638000 +0000", updated_at: "2021-11-17 18:44:01.750638000 +0000", author_id: 4) 
Post.create(id: 16, post: "yes another one", created_at: "2021-11-17 18:44:24.162829000 +0000", updated_at: "2021-11-17 18:44:24.162829000 +0000", author_id: 4) 
Post.create(id: 17, post: "a new one", created_at: "2021-11-17 18:45:17.572486000 +0000", updated_at: "2021-11-17 18:45:17.572486000 +0000", author_id: 6) 
Post.create(id: 19, post: "first post of 2022", created_at: "2022-01-04 16:34:23.562584000 +0000", updated_at: "2022-01-04 16:34:23.562584000 +0000", author_id: 2) 
Post.create(id: 20, post: "a little post from me", created_at: "2022-01-06 11:07:48.541642000 +0000", updated_at: "2022-01-06 11:07:48.541642000 +0000", author_id: 5)


Friend id: 66, created_at: "2022-01-11 19:31:19.307872000 +0000", updated_at: "2022-01-23 17:18:38.134855000 +0000", requester_id: 6, status: "accepted", invited_id: 4>
Friend id: 33, created_at: "2021-11-08 16:49:09.619984000 +0000", updated_at: "2021-11-08 16:49:09.619984000 +0000", requester_id: 5, status: "pending", invited_id: 2>
Friend id: 49, created_at: "2022-01-07 10:31:18.530262000 +0000", updated_at: "2022-01-07 10:31:18.530262000 +0000", requester_id: 6, status: "pending", invited_id: 3>
Friend id: 56, created_at: "2022-01-08 17:29:27.038737000 +0000", updated_at: "2022-01-08 17:29:27.038737000 +0000", requester_id: 4, status: "pending", invited_id: 3>
Friend id: 57, created_at: "2022-01-08 17:39:52.429872000 +0000", updated_at: "2022-01-08 17:39:52.429872000 +0000", requester_id: 4, status: "pending", invited_id: 5>

