##
# helpers functions
##
function sum_item() {
  path=$1
  type=".$2"
  result="$(du -la $path | grep $type | wc -l)"
  echo "$result"
}

function show_sum() {
  printf 'Existe %s %s\n' "$1" "$2"
}
##
# helpers functions
##

path_files=$1
type_file=$2

function sum_images() {
  png="$(sum_item $1 'png')"
  svg="$(sum_item $1 'svg')"
  jpg="$(sum_item $1 'jpg')"
  
  sum="$(($png + $jpg + $svg))"
  echo $sum
}
case $type_file in "imagens")
  sum_result="$(sum_images $path_files)"
  show_sum $sum_result $type_file;;
esac


function sum_textos() {
  txt="$(sum_item $1 'txt')"
  doc="$(sum_item $1 'doc')"
  pdf="$(sum_item $1 'pdf')"
  docx="$(sum_item $1 'docx')"

  sum="$(($txt + $doc + $pdf + $docx))"
  echo $sum
}

case $type_file in "textos")
  sum_result="$(sum_textos $path_files)"
  show_sum  $sum_result $type_file;;
esac


function sum_audio() {
  mp3="$(sum_item $1 'mp3')"

  sum="$(($mp3))"
  echo $sum
}
case $type_file in "audio")
  sum_result="$(sum_audio $path_files)"
  show_sum  $sum_result $type_file;;
esac

function sum_all() {
  sum_result_images="$(sum_images $1)"
  sum_result_texts="$(sum_textos $1)"
  sum_result_audio="$(sum_audio $1)"
  all="$(($sum_result_images + $sum_result_texts + $sum_result_audio))"
  echo $all
}

case $type_file in "all")
  all="$(sum_all $path_files)"
  show_sum  $all $type_file;;
esac

