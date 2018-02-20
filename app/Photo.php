<?php
class Photo{
    private $name;
    private $extension;
    private $path;
    private $realpath;
    private $thumb;
    private $thumbpath;
    private $real_thumpath;
    private $width;
    private $height;
    private $img;
    private $scale;
    private $thumbscale;

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
                        $this->thumb=$this->save_gif_thumb($thumb_image,$new_image,$thumbwidth,$thumbheight,$newwidth,
                            $newheight,$this->real_thumpath);
                        $this->img=$this->save_gif($file,$newwidth,$newheight,$this->realpath);

                        //var_dump($this);
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
    private function save_gif($image,$width,$height,$path){
        try {
            system("convert " . $image . " -coalesce -repage 0x0 -resize " . $width . "x" . $height . " -layers Optimize "
                    . $path . '/' . $this->name);
            return true;
        }catch (Exception $e){
            return false;
        }
    }

    //zapis miniaturki gifa bez animacji
    private function save_gif_thumb($new_image,$image,$width,$height,$oldwidth,$oldheight,$path){
        try{
            imagecolortransparent($new_image, imagecolorallocate($new_image, 0, 0, 0));
            imagecopyresampled($image, $this->img, 0, 0, 0, 0, $oldwidth, $oldheight, $this->width, $this->height);
            imagecopyresampled($new_image, $image, 0, 0, 0, 0, $width, $height, $oldwidth, $oldheight);
            imagegif($new_image, $path . '/' . $this->name);
            return true;
        }catch (Exception $e){
            return false;
        }
    }

    private function delete_image($path,$name){
        $file=$path.'/'.$name;
        if(file_exists($file)){
            unlink($file);
        }
    }

    public function getImg(){
        return $this->img;
    }
    public function getThumb(){
        return $this->thumb;
    }

}