<?php

class ModelCatalogOption extends Model
{

    public function addOption($data)
    {
        $this->event->trigger('pre.admin.option.add', $data);

        $this->db->query("INSERT INTO `" . DB_PREFIX . "option` SET type = '" . $this->db->escape($data['type']) . "', sort_order = '" . (int) $data['sort_order'] . "'");

        $option_id = $this->db->getLastId();

        foreach ($data['option_description'] as $language_id => $value) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "option_description SET option_id = '" . (int) $option_id . "', language_id = '" . (int) $language_id . "', name = '" . $this->db->escape($value['name']) . "'");
        }

        if (isset($data['option_value'])) {
            foreach ($data['option_value'] as $option_value) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "option_value SET option_id = '" . (int) $option_id . "', image = '" . $this->db->escape(html_entity_decode($option_value['image'], ENT_QUOTES, 'UTF-8')) . "', sort_order = '" . (int) $option_value['sort_order'] . "'");

                $option_value_id = $this->db->getLastId();

                foreach ($option_value['option_value_description'] as $language_id => $option_value_description) {
                    $this->db->query("INSERT INTO " . DB_PREFIX . "option_value_description SET option_value_id = '" . (int) $option_value_id . "', language_id = '" . (int) $language_id . "', option_id = '" . (int) $option_id . "', name = '" . $this->db->escape($option_value_description['name']) . "'");
                }
            }
        }

        $this->event->trigger('post.admin.option.add', $option_id);

        return $option_id;
    }

    public function editOption($option_id, $data)
    {
        $this->event->trigger('pre.admin.option.edit', $data);

        $this->db->query("UPDATE `" . DB_PREFIX . "option` SET type = '" . $this->db->escape($data['type']) . "', sort_order = '" . (int) $data['sort_order'] . "' WHERE option_id = '" . (int) $option_id . "'");

        $this->db->query("DELETE FROM " . DB_PREFIX . "option_description WHERE option_id = '" . (int) $option_id . "'");

        foreach ($data['option_description'] as $language_id => $value) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "option_description SET option_id = '" . (int) $option_id . "', language_id = '" . (int) $language_id . "', name = '" . $this->db->escape($value['name']) . "'");
        }

        $this->db->query("DELETE FROM " . DB_PREFIX . "option_value WHERE option_id = '" . (int) $option_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "option_value_description WHERE option_id = '" . (int) $option_id . "'");

        if (isset($data['option_value'])) {
            foreach ($data['option_value'] as $option_value) {
                if ($option_value['option_value_id']) {
                    $this->db->query("INSERT INTO " . DB_PREFIX . "option_value SET option_value_id = '" . (int) $option_value['option_value_id'] . "', option_id = '" . (int) $option_id . "', image = '" . $this->db->escape(html_entity_decode($option_value['image'], ENT_QUOTES, 'UTF-8')) . "', sort_order = '" . (int) $option_value['sort_order'] . "'");
                }
                else {
                    $this->db->query("INSERT INTO " . DB_PREFIX . "option_value SET option_id = '" . (int) $option_id . "', image = '" . $this->db->escape(html_entity_decode($option_value['image'], ENT_QUOTES, 'UTF-8')) . "', sort_order = '" . (int) $option_value['sort_order'] . "'");
                }

                $option_value_id = $this->db->getLastId();

                foreach ($option_value['option_value_description'] as $language_id => $option_value_description) {
                    $this->db->query("INSERT INTO " . DB_PREFIX . "option_value_description SET option_value_id = '" . (int) $option_value_id . "', language_id = '" . (int) $language_id . "', option_id = '" . (int) $option_id . "', name = '" . $this->db->escape($option_value_description['name']) . "'");
                }
            }
        }

        $this->event->trigger('post.admin.option.edit', $option_id);
    }

    public function getOption($option_id)
    {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "option` o LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE o.option_id = '" . (int) $option_id . "' AND od.language_id = '" . (int) $this->config->get('config_language_id') . "'");

        return $query->row;
    }

    public function getOptions($data = array())
    {
        $sql = "SELECT * FROM `" . DB_PREFIX . "option` o LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE od.language_id = '" . (int) $this->config->get('config_language_id') . "'";

        if (!empty($data['filter_name'])) {
            $sql .= " AND od.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
        }

        $sort_data = array(
            'od.name',
            'o.type',
            'o.sort_order'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        }
        else {
            $sql .= " ORDER BY od.name";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        }
        else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }

    public function getOptionDescriptions($option_id)
    {
        $option_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "option_description WHERE option_id = '" . (int) $option_id . "'");

        foreach ($query->rows as $result) {
            $option_data[$result['language_id']] = array('name' => $result['name']);
        }

        return $option_data;
    }

    public function getOptionValue($option_value_id)
    {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "option_value ov LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE ov.option_value_id = '" . (int) $option_value_id . "' AND ovd.language_id = '" . (int) $this->config->get('config_language_id') . "'");

        return $query->row;
    }

    public function getOptionValues($option_id)
    {
        $option_value_data = array();

        $option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "option_value ov LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE ov.option_id = '" . (int) $option_id . "' AND ovd.language_id = '" . (int) $this->config->get('config_language_id') . "' ORDER BY ov.sort_order, ovd.name");

        foreach ($option_value_query->rows as $option_value) {
            $option_value_data[] = array(
                'option_value_id' => $option_value['option_value_id'],
                'name' => $option_value['name'],
                'image' => $option_value['image'],
                'sort_order' => $option_value['sort_order']
            );
        }

        return $option_value_data;
    }

    public function getOptionValueDescriptions($option_id)
    {
        $option_value_data = array();

        $option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "option_value WHERE option_id = '" . (int) $option_id . "' ORDER BY sort_order");

        foreach ($option_value_query->rows as $option_value) {
            $option_value_description_data = array();

            $option_value_description_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "option_value_description WHERE option_value_id = '" . (int) $option_value['option_value_id'] . "'");

            foreach ($option_value_description_query->rows as $option_value_description) {
                $option_value_description_data[$option_value_description['language_id']] = array('name' => $option_value_description['name']);
            }

            $option_value_data[] = array(
                'option_value_id' => $option_value['option_value_id'],
                'option_value_description' => $option_value_description_data,
                'image' => $option_value['image'],
                'sort_order' => $option_value['sort_order']
            );
        }

        return $option_value_data;
    }

    public function getTotalOptions()
    {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "option`");

        return $query->row['total'];
    }

    public function addOptionValue($data)
    {
        $this->event->trigger('pre.admin.option.add', $data);

        $optionName = $this->db->escape($data['option_name']);
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "option_description WHERE name = '" . $optionName . "'");
        $existingOptionDescriptionDataArray = array();
        foreach ($query->rows as $optionDescriptionDataArray) {
            $existingOptionDescriptionDataArray = $optionDescriptionDataArray;
            break;
        }
        if (empty($existingOptionDescriptionDataArray)) {
            $this->db->query("INSERT INTO `" . DB_PREFIX . "option` SET type = '" . $this->db->escape($data['type']) . "', sort_order = '" . (int) $data['sort_order'] . "'");

            $option_id = $this->db->getLastId();

            foreach ($data['option_description'] as $language_id => $value) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "option_description SET option_id = '" . (int) $option_id . "', language_id = '" . (int) $language_id . "', name = '" . $this->db->escape($value['name']) . "'");
            }
        }
        else {
            $option_id = $existingOptionDescriptionDataArray["option_id"];
        }

        if (array_key_exists("product_id", $data)) {
            $product_id = (int) $data['product_id'];
            if ($data['type'] == 'select' || $data['type'] == 'radio' || $data['type'] == 'checkbox' || $data['type'] == 'image') {
                $this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_id = '" . (int) $product_id . "', option_id = '" . (int) $option_id . "', required = '" . (int) $data['required'] . "'");
                $product_option_id = $this->db->getLastId();
                }
                else {
                $this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_id = '" . (int) $product_id . "', option_id = '" . (int) $option_id . "', value = '" . $this->db->escape($data['value']) . "', required = '" . (int) $data['required'] . "'");
                }
            }

        if (isset($data['option_value'])) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "option_value SET option_id = '" . (int) $option_id . "', image = '" . $this->db->escape(html_entity_decode($data['option_value']['image'], ENT_QUOTES, 'UTF-8')) . "', sort_order = '" . (int) $data['option_value']['sort_order'] . "'");

            $option_value_id = $this->db->getLastId();
            if (isset($product_id) && isset($product_option_id) && ($data['type'] == 'select' || $data['type'] == 'radio' || $data['type'] == 'checkbox' || $data['type'] == 'image')) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "product_option_value SET product_option_id = '" . (int) $product_option_id . "', product_id = '" . (int) $product_id . "', option_id = '" . (int) $option_id . "', option_value_id = '" . (int) $option_value_id . "', quantity = '" . (int) $data['quantity'] . "', subtract = '" . (int) $data['subtract'] . "', price = '" . (float) $data['price'] . "', price_prefix = '" . $this->db->escape($data['price_prefix']) . "', points = '" . (int) $data['points'] . "', points_prefix = '" . $this->db->escape($data['points_prefix']) . "', weight = '" . (float) $data['weight'] . "', weight_prefix = '" . $this->db->escape($data['weight_prefix']) . "'");
                $product_option_value_id = $this->db->getLastId();
            }

            foreach ($data['option_value']['option_value_description'] as $language_id => $option_value_description) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "option_value_description SET option_value_id = '" . (int) $option_value_id . "', language_id = '" . (int) $language_id . "', option_id = '" . (int) $option_id . "', name = '" . $this->db->escape($option_value_description['name']) . "'");
            }
        }

        $this->event->trigger('post.admin.option.add', $option_id);

        return array(
            "option_value_id" => $product_option_value_id,
            "option_id" => $product_option_id,
        );
    }
    
    public function addOptionValueToList($data)
    {
        $this->event->trigger('pre.admin.option.add', $data);

        $optionName = $this->db->escape($data['option_name']);
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "option_description WHERE name = '" . $optionName . "'");
        $existingOptionDescriptionDataArray = array();
        foreach ($query->rows as $optionDescriptionDataArray) {
            $existingOptionDescriptionDataArray = $optionDescriptionDataArray;
            break;
        }
        if (empty($existingOptionDescriptionDataArray)) {
            $this->db->query("INSERT INTO `" . DB_PREFIX . "option` SET type = '" . $this->db->escape($data['type']) . "', sort_order = '" . (int) $data['sort_order'] . "'");

            $option_id = $this->db->getLastId();

            foreach ($data['option_description'] as $language_id => $value) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "option_description SET option_id = '" . (int) $option_id . "', language_id = '" . (int) $language_id . "', name = '" . $this->db->escape($value['name']) . "'");
            }
        }
        else {
            $option_id = $existingOptionDescriptionDataArray["option_id"];
        }

        if (array_key_exists("product_id", $data)) {
            $product_id = (int) $data['product_id'];
            // if adding new option value to list 
            if (array_key_exists('additionOperation', $data)) {
                if ($data['additionOperation']) {
                    $product_option = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_option` WHERE product_id = '" . (int) $product_id . "' ");
                    $product_option_id = $product_option->row['product_option_id'];
                }
                // adding the first one
                else {
                    $product_option_id = $this->saveProductOption($data, $product_id, $option_id);
                }
            }
            // if key does not exist -> working from admin panel
            else {
                $product_option_id = $this->saveProductOption($data, $product_id, $option_id);
            }
        }

        if (isset($data['option_value'])) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "option_value SET option_id = '" . (int) $option_id . "', image = '" . $this->db->escape(html_entity_decode($data['option_value']['image'], ENT_QUOTES, 'UTF-8')) . "', sort_order = '" . (int) $data['option_value']['sort_order'] . "'");

            $option_value_id = $this->db->getLastId();
            if (isset($product_id) && isset($product_option_id) && ($data['type'] == 'select' || $data['type'] == 'radio' || $data['type'] == 'checkbox' || $data['type'] == 'image')) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "product_option_value SET product_option_id = '" . (int) $product_option_id . "', product_id = '" . (int) $product_id . "', option_id = '" . (int) $option_id . "', option_value_id = '" . (int) $option_value_id . "', quantity = '" . (int) $data['quantity'] . "', subtract = '" . (int) $data['subtract'] . "', price = '" . (float) $data['price'] . "', price_prefix = '" . $this->db->escape($data['price_prefix']) . "', points = '" . (int) $data['points'] . "', points_prefix = '" . $this->db->escape($data['points_prefix']) . "', weight = '" . (float) $data['weight'] . "', weight_prefix = '" . $this->db->escape($data['weight_prefix']) . "'");
                $product_option_value_id = $this->db->getLastId();
            }

            foreach ($data['option_value']['option_value_description'] as $language_id => $option_value_description) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "option_value_description SET option_value_id = '" . (int) $option_value_id . "', language_id = '" . (int) $language_id . "', option_id = '" . (int) $option_id . "', name = '" . $this->db->escape($option_value_description['name']) . "'");
            }
        }

        $this->event->trigger('post.admin.option.add', $option_id);

        return array(
            "option_value_id" => $product_option_value_id,
            "option_id" => $product_option_id,
        );
    }

    public function editOptionValue($option_value_id, $data)
    {
        if (isset($data['option_value'])) {
            $this->db->query("UPDATE " . DB_PREFIX . "option_value SET image = '" . $this->db->escape(html_entity_decode($data['option_value']['image'], ENT_QUOTES, 'UTF-8')) . "', sort_order = '" . (int) $data['option_value']['sort_order'] . "' WHERE option_value_id = '" . (int) $option_value_id . "'");
            foreach ($data['option_value']['option_value_description'] as $language_id => $option_value_description) {
                $this->db->query("UPDATE " . DB_PREFIX . "option_value_description SET language_id = '" . (int) $language_id . "', name = '" . $this->db->escape($option_value_description['name']) . "' WHERE option_value_id = '" . (int) $option_value_id . "'");
            }
        }
    }

    private function saveProductOption($data, $product_id, $option_id)
    {
        if ($data['type'] == 'select' || $data['type'] == 'radio' || $data['type'] == 'checkbox' || $data['type'] == 'image') {
            $this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_id = '" . (int) $product_id . "', option_id = '" . (int) $option_id . "', required = '" . (int) $data['required'] . "'");
            $product_option_id = $this->db->getLastId();
        }
        else {
            $this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_id = '" . (int) $product_id . "', option_id = '" . (int) $option_id . "', value = '" . $this->db->escape($data['value']) . "', required = '" . (int) $data['required'] . "'");
        }
        return $product_option_id;
    }

}
