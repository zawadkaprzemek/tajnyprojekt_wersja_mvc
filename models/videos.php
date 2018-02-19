<?php
class Videos extends Model{
    public function Index(){
        $data=array();
        $dirs=array_diff(scandir(VIDEOS_PATH),array('..','.'));
        foreach ($dirs as $dir){
            $files=array_diff(scandir(VIDEOS_PATH.DIRECTORY_SEPARATOR.$dir),array('..','.'));
            $arr=array('dir'=>$dir);
            foreach ($files as $file){
                $ext = strtolower(pathinfo($file, PATHINFO_EXTENSION));
                if($ext=='jpg'){
                    $arr['image']=$file;
                }elseif ($ext=='mp4'){
                    $arr['video']=$file;
                }
            }
            array_push($data,$arr);
        }
        return $data;

    }

}