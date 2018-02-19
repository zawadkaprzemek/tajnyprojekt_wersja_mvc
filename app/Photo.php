<?php
class Photo{
    public $name;
    public $extension;
    public $path;
    public $realpath;
    public $thumb;
    public $thumbpath;
    public $real_thumpath;
    public $width;
    public $height;
    public $img;
    public $scale;
    public $thumbscale;

    const MAXWIDTH = 800;
    const MAXHEIGHT = 800;
    const THUMBWIDTH = 100;
    const THUMBHEIGHT = 100;

    public function __construct($user,$gallery,$name,$file=null){
        $this->path=$this->get_path($user,$gallery);
        $this->thumbpath=$this->get_thumb_path();
        $this->realpath=$this->real_path($this->path);
        $this->real_thumpath=$this->real_path($this->thumbpath);
        $this->name=$name;
        $this->extension=$this->get_extension();
        if(isset($file)){
            if($this->check_paths()){

                $this->create_image($file);
                $this->get_scale();

                $newwidth=$this->width*$this->scale;
                $newheight=$this->height*$this->scale;
                $thumbwidth=$this->width*$this->thumbscale;
                $thumbheight=$this->height*$this->thumbscale;

                $new_image=imagecreatetruecolor($newwidth, $newheight);
                $thumb_image=imagecreatetruecolor($thumbwidth, $thumbheight);
                switch ($this->extension){
                    case 'jpg':
                    case 'jpeg':
                        $this->img=$this->save_jpg($new_image,$this->img,$newwidth,$newheight,$this->width,
                            $this->height,$this->realpath);
                        $this->thumb=$this->save_jpg($thumb_image,$new_image,$thumbwidth,$thumbheight,$newwidth,$newheight,
                            $this->real_thumpath);
                        break;
                    case 'png':
                        $this->img=$this->save_png($new_image,$this->img,$newwidth,$newheight,$this->width,
                            $this->height,$this->realpath);
                        $this->thumb=$this->save_png($thumb_image,$new_image,$thumbwidth,$thumbheight,$newwidth,$newheight,
                            $this->real_thumpath);
                        break;
                    case 'gif':
                        $this->img=imagecreatefromgif($file);
                        break;
                    default:
                        return false;
                        break;
                }
            }else{
                return false;
            }
        }

    }

    public function destroy()
    {
        if($this->check_paths()){
            try{
                $this->delete_image($this->realpath,$this->name);
                $this->delete_image($this->real_thumpath,$this->name);
                return true;
            }catch (Exception $e){
                echo $e->getMessage();
            }
        }
    }

    //zwraca path do galerii użytkownika
    private function get_path($user,$gallery){
        if($gallery=='private'){
            $path=GALLERY_PATH.'/'.strtolower($user).'/private';
        }else{
            $path=GALLERY_PATH.'/'.strtolower($user);
        }
        return $path;
    }

    private function real_path($path){
        return realpath($path);
    }

    //zwraca path do miniaturek w galerii użytkownika
    private function get_thumb_path(){
        return $this->path.'/thumbnail';
    }

    //sprawdza czy path istnieje, jeśli nie to go tworzy
    private function check_paths(){
        if($this->realpath === false AND !is_dir($this->realpath)){
            $this->create_path($this->path);
            $this->realpath=$this->real_path($this->path);
        }
        if($this->real_thumpath === false AND !is_dir($this->real_thumpath)){
            $this->create_path($this->thumbpath);
            $this->real_thumpath=$this->real_path($this->thumbpath);
        }
        return true;
    }

    private function create_path($path){
        try{
            mkdir($path,0777,true);
            return true;
        }
        catch (Exception $e){
            echo $e->getMessage();
            return false;
        }
    }

    private function get_extension(){
        return strtolower(substr(strrchr($this->name, '.'), 1));
    }

    private function get_width($file){
        return imagesx($file);
    }

    private function get_height($file){
        return imagesy($file);
    }

    private function create_image($file){
        switch ($this->extension){
            case 'jpg':
            case 'jpeg':
                $this->img=imagecreatefromjpeg($file);
                break;
            case 'png':
                $this->img=imagecreatefrompng($file);
                break;
            case 'gif':
                $this->img=imagecreatefromgif($file);
                break;
            default:
                return false;
                break;
        }
        $this->width=$this->get_width($this->img);
        $this->height=$this->get_height($this->img);
    }

    private function get_scale(){
        $scale = min(
            SELF::MAXWIDTH / $this->width,
            SELF::MAXHEIGHT / $this->height
        );
        $this->scale=($scale<1? $scale : 1);
        $this->thumbscale= min(
            SELF::THUMBWIDTH/$this->width,
            SELF::THUMBHEIGHT/$this->height
        );
    }

    //zapis jako jpg
    private function save_jpg($new_image,$image,$width,$height,$oldwidth,$oldheight,$path){
        try{
            imagecopyresampled($new_image, $image, 0, 0, 0, 0, $width , $height, $oldwidth , $oldheight);
            imagejpeg($new_image, $path.'/'.$this->name, 80);
            return true;
        }catch (Exception $e){
            return false;
        }
    }


    //zapis jako png
    private function save_png($new_image,$image,$width,$height,$oldwidth,$oldheight,$path){
        try{
            imagesavealpha($new_image, true);
            $color = imagecolorallocatealpha($new_image, 0, 0, 0, 127);
            imagefill($new_image, 0, 0, $color);
            imagecopyresampled($new_image, $image, 0, 0, 0, 0, $width , $height, $oldwidth , $oldheight);
            imagepng($new_image, $path.'/'.$this->name, 9);
            return true;
        }catch (Exception $e){
            return false;
        }

    }

    //zapis jako git
    private function save_gif($new_image,$image,$width,$height,$oldwidth,$oldheight,$path){

    }

    private function delete_image($path,$name){
        $file=$path.'/'.$name;
        if(file_exists($file)){
            unlink($file);
        }
    }

}