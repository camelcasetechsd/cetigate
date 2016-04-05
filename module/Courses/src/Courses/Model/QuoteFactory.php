<?php

namespace Courses\Model;

use Zend\ServiceManager\FactoryInterface;
use Zend\ServiceManager\ServiceLocatorInterface;
use Courses\Model\Quote;

/**
 * Quote Factory
 * 
 * Prepare Quote service factory
 * 
 * 
 * @package courses
 * @subpackage model
 */
class QuoteFactory implements FactoryInterface {

    /**
     * Prepare Quote service
     * 
     * @uses Quote
     * 
     * @access public
     * @param ServiceLocatorInterface $serviceLocator
     * @return Quote
     */
    public function createService(ServiceLocatorInterface $serviceLocator) {
        $query = $serviceLocator->get('wrapperQuery');
        $translationHandler = $serviceLocator->get('translatorHandler');
        $formView = $serviceLocator->get('Utilities\Service\View\FormView');
        $quoteGenerator = $serviceLocator->get('Courses\Model\QuoteGenerator');
        return new Quote($query, $translationHandler, $formView, $quoteGenerator);
    }

}
