name=$(gh auth status | grep as | cut -d' ' -f9- | cut -d' ' -f-1)
rawresult=$(gh api /users/${name}/repos)
rawresult=$(echo $rawresult | tr ',' '\n' | grep "full_name" | wc -l)

echo $rawresult
