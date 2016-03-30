<?php

namespace IssueTracker\Model;

use IssueTracker\Service\IssueCategories;
use IssueTracker\Entity\Issue as IssuesEntity;
use IssueTracker\Entity\IssueCategory as CatergoriesEntity;
use Doctrine\Common\Collections\Criteria;
use Zend\File\Transfer\Adapter\Http;
use Utilities\Service\Random;
use Utilities\Service\Status;
use Doctrine\ORM\EntityRepository;
use Zend\Authentication\AuthenticationService;
use Users\Entity\Role;

class Issues
{

    /**
     * path to save issue attachments 
     */
    const ISSUE_ATTACHMENT_PATH = 'public/upload/IssueAttachments/';

    /*
     *
     * @var Utilities\Service\Query\Query 
     */

    protected $query;

    /**
     *
     * @var Notifications\Service\Notification
     */
    protected $notification;

    /**
     *
     * @var Utilities\Service\Random 
     */
    protected $random;

    /**
     * Set needed properties
     * 
     * 
     * @access public
     * 
     * @param Utilities\Service\Query\Query $query
     * @param Notifications\Service\Notification $notification
     */
    public function __construct($query, $notification)
    {
        $this->query = $query;
        $this->notification = $notification;
        $this->random = new Random();
    }

    /**
     * Saving reported issues
     * @param type $data
     * @param IssuesEntity $issueObj
     */
    public function saveIssue($data, $issueObj = null)
    {
        if ($issueObj == null) {
            $issueObj = new IssuesEntity();
        }
        $parent = $this->query->findOneBy('IssueTracker\Entity\IssueCategory', array(
            'id' => $data['parent']
        ));
        $auth = new AuthenticationService();
        $storage = $auth->getIdentity();
        $issueObj->setCreated();
        $issueObj->setUser($this->query->findOneBy('Users\Entity\User', array('id' => $storage['id'])));
        $issueObj->setCategory($parent);
        $paths = array();
        foreach ($data['filePath'] as $file) {
            if (!empty($file['name'])) {
                $uploadResult = $this->uploadAttachment($file['name'], self::ISSUE_ATTACHMENT_PATH);
                array_push($paths, $uploadResult);
            }
            $issueObj->setFilePath(serialize($paths));
        }
        $issueObj->setStatus(Status::STATUS_ACTIVE);
        $this->query->setEntity('IssueTracker\Entity\Issue')->save($issueObj, $data);
    }

    /**
     * upload issue attachments
     * @param type $filename
     * @param type $attachmentPath
     * @return string
     */
    private function uploadAttachment($filename, $attachmentPath)
    {
        $uploadResult = null;
        $upload = new Http();
        $upload->setDestination($attachmentPath);
        try {
            // upload received file(s)
            $upload->receive($filename);
        } catch (\Exception $e) {
            return $uploadResult;
        }
        //This method will return the real file name of a transferred file.
        $name = $upload->getFileName($filename);
        //This method will return extension of the transferred file
        $extention = pathinfo($name, PATHINFO_EXTENSION);
        //get random new name
        $newName = $this->random->getRandomUniqueName() . '_' . date('Y.m.d_h:i:sa');
        $newFullName = $attachmentPath . $newName . '.' . $extention;
        // rename
        rename($name, $newFullName);
        $uploadResult = $newFullName;
        return $uploadResult;
    }

    /**
     * list all issues both active and closed except inactive('deleted') issues
     * @return array
     */
    public function listIssues()
    {
        $repository = $this->query->entityManager;
        $queryBuilder = $repository->createQueryBuilder();
        $expr = $queryBuilder->expr();
        $queryBuilder->select('i')
                ->from('IssueTracker\Entity\Issue', 'i');

        return $queryBuilder->getQuery()->getResult();
    }

    public function getIssue($issueId)
    {
        return $this->query->findOneBy('IssueTracker\Entity\Issue', array(
                    'id' => $issueId
        ));
    }

    /**
     * prepare issues texts for view
     * @param Array | IssueTracker\Entity\Issue $issues
     * @return Array | IssueTracker\Entity\Issue 
     */
    public function prepareIssuesToView($issues)
    {
        foreach ($issues as $issue) {
            // preparing status text
            switch ($issue->getStatus()) {
                case 0:
                    $issue->statusText = (Status::STATUS_CLOSED_TEXT);
                    break;
                case 1:
                    $issue->statusText = (Status::STATUS_ACTIVE_TEXT);
                    break;
            }
            // preparing parent tree
            $issue = $this->getParentTree($issue);
        }

        return $issues;
    }

    /**
     * creating 3 depth tree for parents if existed
     * @param IssueTracker\Entity\Issue $issue
     * @return IssueTracker\Entity\Issue $issue
     */
    private function getParentTree($issue)
    {   // getting issue category
        $issue->parent3 = $issue->getCategory();
        if ($issue->parent3 != null) {
            $issue->parent2 = $issue->parent3->getParent();
            if ($issue->parent2 != null) {
                $issue->parent1 = $issue->parent2->getParent();
            }
        }
        return $issue;
    }

    public function deleteIssue($issueId)
    {
        $issue = $this->query->findOneBy('IssueTracker\Entity\Issue', array(
            'id' => $issueId
        ));
        $this->query->remove($issue);
    }

    public function closeIssue($issueId)
    {
        $issue = $this->query->findOneBy('IssueTracker\Entity\Issue', array(
            'id' => $issueId
        ));
        $issue->setStatus(Status::STATUS_CLOSED);
        $this->query->save($issue);
    }

    public function reopenIssue($issueId)
    {
        $issue = $this->query->findOneBy('IssueTracker\Entity\Issue', array(
            'id' => $issueId
        ));
        $issue->setStatus(Status::STATUS_ACTIVE);
        $this->query->save($issue);
    }

    public function validateUser()
    {
        $auth = new AuthenticationService();
        $storage = $auth->getIdentity();
        if (in_array(Role::ADMIN_ROLE, $storage['roles'])) {
            return true;
        }
        return false;
    }

    public function getCurrentUser()
    {
        $auth = new AuthenticationService();
        $storage = $auth->getIdentity();
        return $this->query->findOneBy('Users\Entity\User', array(
                    'id' => $storage['id']
        ));
    }

}
