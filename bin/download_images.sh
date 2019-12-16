#!/bin/bash

# exit when any command fails
set -e

# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# echo an error message before exiting
trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT

PROCESS_FOLDER=$1

if [ -z "$PROCESS_FOLDER" ]
then
    exit_code=1
    exit $exit_code
fi

rm -rf ${PROCESS_FOLDER}
mkdir -p ${PROCESS_FOLDER}

curl http://content.sportslogos.net/logos/40/1438/full/6661.gif	> ${PROCESS_FOLDER}/237.gif
curl http://content.sportslogos.net/logos/39/3874/full/453_pensacola-blue_wahoos-primary-2012.png	> ${PROCESS_FOLDER}/4124.png
curl http://content.sportslogos.net/logos/39/2809/full/qh423wjv0wdl1g5xotoke6tn2.gif	> ${PROCESS_FOLDER}/104.gif
curl http://content.sportslogos.net/logos/45/2744/full/9727_charleston_riverdogs-primary-2016.png	> ${PROCESS_FOLDER}/233.png
curl http://content.sportslogos.net/logos/37/1024/full/3596_round_rock_express-primary-2019.png	> ${PROCESS_FOLDER}/102.png
curl http://content.sportslogos.net/logos/37/1025/full/6ectyfh0szrs9qg01t3pkg2tg.gif	> ${PROCESS_FOLDER}/105.gif
curl http://content.sportslogos.net/logos/37/1018/full/6563_memphis_redbirds-primary-2017.png	> ${PROCESS_FOLDER}/235.png
curl http://content.sportslogos.net/logos/37/5545/full/7769_oklahoma_city_dodgers-primary-2015.png	> ${PROCESS_FOLDER}/238.png
curl http://content.sportslogos.net/logos/54/50/full/gnnnrbxcmjhdgeu6mavqk3945.png	> ${PROCESS_FOLDER}/109.png
curl http://content.sportslogos.net/logos/54/54/full/q9gvs07u72gc9xr3395u6jh68.png	> ${PROCESS_FOLDER}/112.png
curl http://content.sportslogos.net/logos/54/56/full/z9e0rqit393ojiizsemd0t1hx.png	> ${PROCESS_FOLDER}/113.png
curl http://content.sportslogos.net/logos/54/58/full/6871_colorado_rockies-primary-2017.png	> ${PROCESS_FOLDER}/115.png
curl http://content.sportslogos.net/logos/54/63/full/efvfv5b5g1zgpsf56gb04lthx.png	> ${PROCESS_FOLDER}/119.png
curl http://content.sportslogos.net/logos/54/578/full/rcehah9k0kekjkgzm077fflws.png	> ${PROCESS_FOLDER}/120.png
curl http://content.sportslogos.net/logos/54/67/full/1208_new_york_mets-alternate-2014.png	> ${PROCESS_FOLDER}/121.png
curl http://content.sportslogos.net/logos/54/71/full/1250_pittsburgh_pirates-primary-2014.png	> ${PROCESS_FOLDER}/134.png
curl http://content.sportslogos.net/logos/54/73/full/7517_san_diego_padres-primary-2020.png	> ${PROCESS_FOLDER}/135.png
curl http://content.sportslogos.net/logos/54/74/full/cpqj6up5bvgpoedg5fwsk20ve.png	> ${PROCESS_FOLDER}/137.png
curl http://content.sportslogos.net/logos/54/72/full/3zhma0aeq17tktge1huh7yok5.png	> ${PROCESS_FOLDER}/138.png
curl http://content.sportslogos.net/logos/54/70/full/7579_philadelphia_phillies-primary-2019.png	> ${PROCESS_FOLDER}/143.png
curl http://content.sportslogos.net/logos/54/51/full/7150_atlanta_braves-primary-2018.png	> ${PROCESS_FOLDER}/144.png
curl http://content.sportslogos.net/logos/54/3637/full/7544_miami_marlins-primary-2019.png	> ${PROCESS_FOLDER}/146.png
curl http://content.sportslogos.net/logos/54/64/full/6474_milwaukee_brewers-primary-2020.png	> ${PROCESS_FOLDER}/158.png
curl https://cdn.dribbble.com/users/201299/screenshots/4379374/baseball_logo_dribbble.png	> ${PROCESS_FOLDER}/230.png
curl https://cdn.dribbble.com/users/201299/screenshots/4379374/baseball_logo_dribbble.png	> ${PROCESS_FOLDER}/241.png
curl http://content.sportslogos.net/logos/36/927/full/irotcebfu1yhj0yud5egfgfpe.gif	> ${PROCESS_FOLDER}/234.gif
curl http://content.sportslogos.net/logos/38/1036/full/8192_erie_seawolves-primary-2013.png	> ${PROCESS_FOLDER}/106.png
curl https://cdn.dribbble.com/users/201299/screenshots/4379374/baseball_logo_dribbble.png	> ${PROCESS_FOLDER}/2097.png
curl https://cdn.dribbble.com/users/201299/screenshots/4379374/baseball_logo_dribbble.png	> ${PROCESS_FOLDER}/2117.png
curl https://cdn.dribbble.com/users/201299/screenshots/4379374/baseball_logo_dribbble.png	> ${PROCESS_FOLDER}/2128.png
curl https://cdn.dribbble.com/users/201299/screenshots/4379374/baseball_logo_dribbble.png	> ${PROCESS_FOLDER}/2131.png
curl https://cdn.dribbble.com/users/201299/screenshots/4379374/baseball_logo_dribbble.png	> ${PROCESS_FOLDER}/2132.png
curl https://cdn.dribbble.com/users/201299/screenshots/4379374/baseball_logo_dribbble.png	> ${PROCESS_FOLDER}/2270.png
curl http://content.sportslogos.net/logos/41/2138/full/gatxy5ed07vg6nghave0.gif	> ${PROCESS_FOLDER}/103.gif
curl https://cdn.dribbble.com/users/201299/screenshots/4379374/baseball_logo_dribbble.png	> ${PROCESS_FOLDER}/4144.png
curl https://cdn.dribbble.com/users/201299/screenshots/4379374/baseball_logo_dribbble.png	> ${PROCESS_FOLDER}/4164.png
curl https://cdn.dribbble.com/users/201299/screenshots/4379374/baseball_logo_dribbble.png	> ${PROCESS_FOLDER}/4184.png
curl https://cdn.dribbble.com/users/201299/screenshots/4379374/baseball_logo_dribbble.png	> ${PROCESS_FOLDER}/4224.png
curl https://cdn.dribbble.com/users/201299/screenshots/4379374/baseball_logo_dribbble.png	> ${PROCESS_FOLDER}/4245.png
curl https://cdn.dribbble.com/users/201299/screenshots/4379374/baseball_logo_dribbble.png	> ${PROCESS_FOLDER}/4285.png
curl https://cdn.dribbble.com/users/201299/screenshots/4379374/baseball_logo_dribbble.png	> ${PROCESS_FOLDER}/225.png
curl https://cdn.dribbble.com/users/201299/screenshots/4379374/baseball_logo_dribbble.png	> ${PROCESS_FOLDER}/227.png
curl https://cdn.dribbble.com/users/201299/screenshots/4379374/baseball_logo_dribbble.png	> ${PROCESS_FOLDER}/236.png
curl https://cdn.dribbble.com/users/201299/screenshots/4379374/baseball_logo_dribbble.png	> ${PROCESS_FOLDER}/2290.png
curl http://content.sportslogos.net/logos/53/6521/full/4389_los_angeles_angels-primary-2016.png	> ${PROCESS_FOLDER}/108.png
curl http://content.sportslogos.net/logos/53/52/full/5800_baltimore_orioles-primary-2019.png	> ${PROCESS_FOLDER}/110.png
curl http://content.sportslogos.net/logos/53/53/full/c0whfsa9j0vbs079opk2s05lx.png	> ${PROCESS_FOLDER}/111.png
curl http://content.sportslogos.net/logos/53/57/full/5347_cleveland_indians-primary-2014.png	> ${PROCESS_FOLDER}/114.png
curl http://content.sportslogos.net/logos/53/59/full/8964_detroit_tigers-primary-2016.png	> ${PROCESS_FOLDER}/116.png
curl http://content.sportslogos.net/logos/53/4929/full/9503_houston_astros-primary-2000.png	> ${PROCESS_FOLDER}/117.png
curl http://content.sportslogos.net/logos/53/62/full/8322_kansas_city_royals-primary-2019.png	> ${PROCESS_FOLDER}/118.png
curl http://content.sportslogos.net/logos/53/69/full/6xk2lpc36146pbg2kydf13e50.png	> ${PROCESS_FOLDER}/133.png
curl http://content.sportslogos.net/logos/53/75/full/1305.png	> ${PROCESS_FOLDER}/136.png
curl http://content.sportslogos.net/logos/53/2535/full/9448_tampa_bay_rays-primary-2019.png	> ${PROCESS_FOLDER}/139.png
curl http://content.sportslogos.net/logos/53/77/full/ajfeh4oqeealq37er15r3673h.png	> ${PROCESS_FOLDER}/140.png
curl http://content.sportslogos.net/logos/53/78/full/2559d7603ouedg7ldhw0br4fn.png	> ${PROCESS_FOLDER}/141.png
curl http://content.sportslogos.net/logos/53/65/full/peii986yf4l42v3aa3hy0ovlf.png	> ${PROCESS_FOLDER}/142.png
curl http://content.sportslogos.net/logos/53/55/full/oxvkprv7v4inf5dgqdebp0yse.png	> ${PROCESS_FOLDER}/145.png
curl http://content.sportslogos.net/logos/53/68/full/1256.png	> ${PROCESS_FOLDER}/147.png
curl https://cdn.dribbble.com/users/201299/screenshots/4379374/baseball_logo_dribbble.png	> ${PROCESS_FOLDER}/4104.png
curl https://cdn.dribbble.com/users/201299/screenshots/4379374/baseball_logo_dribbble.png	> ${PROCESS_FOLDER}/100.png
curl https://cdn.dribbble.com/users/201299/screenshots/4379374/baseball_logo_dribbble.png	> ${PROCESS_FOLDER}/101.png
curl https://cdn.dribbble.com/users/201299/screenshots/4379374/baseball_logo_dribbble.png	> ${PROCESS_FOLDER}/4244.png
curl https://cdn.dribbble.com/users/201299/screenshots/4379374/baseball_logo_dribbble.png	> ${PROCESS_FOLDER}/4264.png
curl https://cdn.dribbble.com/users/201299/screenshots/4379374/baseball_logo_dribbble.png	> ${PROCESS_FOLDER}/4284.png
curl https://cdn.dribbble.com/users/201299/screenshots/4379374/baseball_logo_dribbble.png	> ${PROCESS_FOLDER}/4286.png
curl https://cdn.dribbble.com/users/201299/screenshots/4379374/baseball_logo_dribbble.png	> ${PROCESS_FOLDER}/4304.png
curl https://cdn.dribbble.com/users/201299/screenshots/4379374/baseball_logo_dribbble.png	> ${PROCESS_FOLDER}/226.png
curl https://cdn.dribbble.com/users/201299/screenshots/4379374/baseball_logo_dribbble.png	> ${PROCESS_FOLDER}/228.png
curl https://cdn.dribbble.com/users/201299/screenshots/4379374/baseball_logo_dribbble.png	> ${PROCESS_FOLDER}/231.png
curl https://cdn.dribbble.com/users/201299/screenshots/4379374/baseball_logo_dribbble.png	> ${PROCESS_FOLDER}/232.png

sips -s format png ${PROCESS_FOLDER}/*.gif --out ${PROCESS_FOLDER}
rm ${PROCESS_FOLDER}/*.gif

set -o history -o histexpand
