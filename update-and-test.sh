#!/usr/bin/env bash
cd /home/ansible/repo
git pull origin master
chmod 777 * -R
header='--header=Authorizarion: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjRjZWM2NTU5NTNiMzg0MDI0MjkwZWVkYWM0NjQzNjc1OWVlYmMwMzMwOWEwNmU3Nzc2ZjBiNTI3NjdhMWRhNWE1ZWI4MDJkOGFiNjY0MDBkIn0.eyJhdWQiOiIyIiwianRpIjoiNGNlYzY1NTk1M2IzODQwMjQyOTBlZWRhYzQ2NDM2NzU5ZWViYzAzMzA5YTA2ZTc3NzZmMGI1Mjc2N2ExZGE1YTVlYjgwMmQ4YWI2NjQwMGQiLCJpYXQiOjE1NzE4MzE0NjYsIm5iZiI6MTU3MTgzMTQ2NiwiZXhwIjoxNjAzNDUzODY1LCJzdWIiOiI5Iiwic2NvcGVzIjpbXX0.m7iSuN3Z_HSG-ApYr04AZiq8bPp_YBYd1UQWFCsktqKl8U1xn_luQ90GwFDHY5ELf9IeacjFCr-oPHIjNZDcdbHe9mnBdgjlRGr5M1NDgroP9IcDHtBLUwwf9n_gpNWG2L-W0-NtpZ1BQ11Z4mh72MmD3uTtmGbC8bAPs6ZbCzSWiAi3eXoLiFk_GAnNolwOUl3JDdKMiBQT4eErRktPTFoQoL4PBE6PHOFStXHLh4WrM4TNUodBDwksHSPhQVXVkc67oOPZWD5OyhwM0-UpiEZ5MrNsymXpbTrwnxquUewU-_MxDM5p2jKP23OXOfSvibqbkPWhPtsLrn6V7rzvpauZSzzEJP8FEQKdTTqOp53BQsr8-wdRnWrCaHI5jZ_erDxVxHf3lqTJaEPGSw5D7F3OpIUuBJzd9u4nxAvLcEapSrb1wN-uGPzR84i152gJk6Xo2ourEIw2okmig2J9ulSs7QJ_pmMUEov5Nut3J-FNRTgj_A7qWlxGYnX4ZA8MS3wnvpLriRZ22IxKG_OFWuKWn3ETNRe0KRHcMpBUz3Qw5CXTYIsf7Aqb_re0CcezL_PetlDC5fW6kjrbR82krZf4lBmasPZ-30Rt9kdVhmpqg6axhguVFr3YSt8XbDAxj_RNrYU55zbk4k4KCzuSnJka7VwVsHd7_3dZJ8bODjg'
wget "$header" http://apiv2/v2/ansible/scan -O index