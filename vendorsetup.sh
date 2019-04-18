if [[ -e vendor/aosp ]] || [[ -e vendor/DarkJoker360 ]]; then
add_lunch_combo aosp_prague-userdebug
elif [[ -e vendor/dot ]]; then
add_lunch_combo dot_prague-userdebug
elif [[ -e vendor/lineage ]]; then
add_lunch_combo lineage_prague-userdebug
elif [[ -e vendor/aoscp ]]; then
add_lunch_combo aoscp_prague-userdebug
elif [[ -e vendor/candy ]]; then
add_lunch_combo candy_prague-userdebug
fi
