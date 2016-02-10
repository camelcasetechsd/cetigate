<?php

namespace CMS\Model;

use CMS\Entity\Page as PageEntity;
use Utilities\Service\Random;
use Zend\File\Transfer\Adapter\Http;

/**
 * Page Model
 * 
 * Handles Page Entity related business
 * 
 * 
 * @property Utilities\Service\Query\Query $query
 * 
 * @package cms
 * @subpackage model
 */
class Page
{

    const UPLOAD_PATH = 'public/upload/pageContents/';

    /**
     *
     * @var Utilities\Service\Query\Query 
     */
    protected $query;

    /**
     *
     * @var Utilities\Service\Random;

     */
    protected $random;

    /**
     * Set needed properties
     * 
     * @access public
     * @param Utilities\Service\Query\Query $query
     */
    public function __construct($query)
    {
        $this->query = $query;
        $this->random = new Random();
    }

    /**
     * Prepare logs
     * 
     * @access public
     * @param array $logs
     * @return array logs prepared for display
     */
    public function prepareHistory($logs)
    {
        $dummyPage = new PageEntity();
        foreach ($logs as &$log) {
            foreach ($log['data'] as $dataKey => &$dataValue) {
                if ($dataKey == "body") {
                    $dummyPage->body = $dataValue;
                    $dataValue = $dummyPage->getBody();
                }
            }
        }
        return $logs;
    }

    public function uploadImage($fileData)
    {

        $upload = new Http();
        $upload->setDestination(self::UPLOAD_PATH);
        try {

            // upload received file(s)
            $upload->receive();
            
        } catch (\Exception $e) {
//            return $uploadResult;
        }
        //This method will return the real file name of a transferred file.
        $name = $upload->getFileName($fileData['upload']['name']);
        //This method will return extension of the transferred file
        $extention = pathinfo($name, PATHINFO_EXTENSION);
        //get random new name
        $newName = $this->random->getRandomUniqueName();
        $newFullName = self::UPLOAD_PATH . $newName . '.' . $extention;
        // rename
        rename($name, $newFullName);
        $uploadResult = $newFullName;

        return $uploadResult;
    }

}
