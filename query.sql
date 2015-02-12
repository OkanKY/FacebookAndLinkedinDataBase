/*
@gmail.com e_postali kullanıcının CV Descriptions'u
*/

SELECT S.cv_section_description
FROM Cv_sections as S
where S.cv_id IN
(select C.cv_id from Cvs as C where  C.user_id IN
(select U.user_id  from user as U  where U.email_address='@gmail.com' ));


/* Tum kullanıcıların User bilgileri ve CV bilgilerini getirir.*/    
select *
from user natural join Cvs, Cv_sections
where Cvs.cv_id= Cv_sections.cv_id;


/* '@gmail.com' adresine sahip kişinin tüm CV bilgilerini getirir */
select *
from  user natural join Cvs ,Cv_sections
where user.email_address='@gmail.com' 
and Cvs.cv_id= Cv_sections.cv_id  ;

/*Bir userin takip ettigi kişilerin bilgileri*/
SELECT *
FROM People_beeing_followed
WHERE People_beeing_followed.member_beeing_followed_id IN (
							SELECT user.user_id
							FROM user
							WHERE user.name_first='okan' AND user.name_last='kaya');
							

/*Bir kişinin üyesi oldugu tum guruplar*/
           SELECT *
           FROM Groups
           WHERE Groups.group_id IN 
           (SELECT group_id
           FROM User_groups
           WHERE User_groups.user_id IN (
							SELECT user.user_id
							FROM user
							WHERE user.name_first='okan' AND user.name_last='kaya'));

/*Bir kullanıcının Begendigi durumlar*/
SELECT *
           FROM Status
           WHERE Status.status_id IN
           (SELECT status_id
           FROM Thumb_up_down
           WHERE Thumb_up_down.friend_id IN
           (SELECT friend_id
           FROM Friend
           WHERE Friend.user_id IN (
							SELECT user_id
							FROM user
							WHERE user.name_first='okan' AND user.name_last='kaya')));
                            
                            
 /*Bir kullanicinin üye oldugu guruplarda bulunan kişilerin listesi*/                           
           
		SELECT *
		FROM user
		WHERE user.user_id IN        
           (SELECT User_groups.user_id
           FROM User_groups
           WHERE User_groups.group_id IN 
           (SELECT User_groups.group_id
           FROM User_groups
           WHERE User_groups.user_id IN (
							SELECT user.user_id
							FROM user
							WHERE user.name_first='Jason' AND user.name_last='Martin')));
                            
 /* Bir Kullanicinin bildigi diller*/
SELECT Language.lang
FROM Language
WHERE Language.user_id IN (
							SELECT user.user_id
							FROM user
							WHERE user.name_first='okan' AND user.name_last='kaya');
 /*İlişki durumu single olanlar*/
 
SELECT user.name_first,user.name_last, user.email_address
FROM user
WHERE user.user_id IN (
							SELECT Ref_marital_status.user_id
							FROM Ref_marital_status
							WHERE Ref_marital_status.marital_status_description='Single');
/*Bir kullanıcının tüm arkadaş bilgileri*/
    
SELECT *
FROM user
WHERE user.user_id IN   
	(SELECT Friend.friend_user_id
     FROM Friend
     WHERE Friend.user_id IN 
                          (SELECT user.user_id
							FROM user
							WHERE user.name_first='okan' AND user.name_last='kaya'));    
